import torch
import torch.nn as nn
import torch.nn.functional as F
import time
import tqdm
import numpy as np

# === 全局参数 ===
thresh = 0.6
lens = thresh
decay = 0.2
MAX_TIME = 130

# === 近似脉冲激活函数 ===
class ActFun(torch.autograd.Function):
    @staticmethod
    def forward(ctx, input):
        ctx.save_for_backward(input)
        return input.gt(thresh).float()

    @staticmethod
    def backward(ctx, grad_output):
        input, = ctx.saved_tensors
        grad_input = grad_output.clone()
        scope = abs(input - thresh) <= lens
        is_spike = input >= thresh
        return grad_input * (1.0 + is_spike.float()) * scope.float()

act_fun_default = ActFun.apply

# === 含突触延迟的膜电位更新 ===
def delayed_mem_update(x_seq, mem, spike, act_fun, delays=[0,1,2], taus=[1.0,2.0,4.0]):
    B, T, C = x_seq.shape
    v_total = torch.zeros(B, T, C, device=x_seq.device)
    for d, tau in zip(delays, taus):
        if d > 0:
            delayed = F.pad(x_seq, (0, 0, d, 0))[:, :-d, :]
        else:
            delayed = x_seq
        v_total += delayed * torch.exp(torch.tensor(-d / tau, device=x_seq.device))
    mem_t = mem * decay * (1 - spike) + v_total
    spike_t = act_fun(mem_t)
    return mem_t, spike_t

# === 延迟突触神经元 ===
class LIF_with_delay(nn.Module):
    def __init__(self, act_fun=act_fun_default, device=torch.device("cpu")):
        super().__init__()
        self.act_fun = act_fun
        self.device = device
        self.h_mem = None
        self.h_spike = None

    def init_mem(self, B, T, C):
        self.h_mem = torch.zeros(B, T, C, device=self.device)
        self.h_spike = torch.zeros(B, T, C, device=self.device)

    def forward(self, x_seq):
        B, T, C = x_seq.shape
        self.init_mem(B, T, C)
        self.h_mem, self.h_spike = delayed_mem_update(x_seq, self.h_mem, self.h_spike, self.act_fun)
        return self.h_spike.sum(dim=1)  # [B, C]

# === SNN 网络结构（基于突触延迟） ===
class SNN_SynapticDelay(nn.Module):
    def __init__(self, device='cpu', n_input=64, n_class=11):
        super().__init__()
        self.device = device
        self.linear = nn.Linear(n_input, n_class, bias=False)
        self.neuron = LIF_with_delay(device=device)

    def forward(self, x):  # [B, T, C]
        spike_out = self.neuron(x)
        return self.linear(spike_out)

# === 初始化权重 ===
def init_weights(m):
    if type(m) == nn.Linear:
        torch.nn.init.xavier_normal_(m.weight)

# === 学习率调整策略 ===
def lr_scheduler(optimizer, epoch, init_lr=0.1, lr_decay_epoch=50):
    if epoch % lr_decay_epoch == 0 and epoch > 1:
        for param_group in optimizer.param_groups:
            param_group['lr'] = param_group['lr'] * 0.5
    return optimizer

# === 测试函数 ===
def test_snn(snn, args, test_loader, device=None):
    correct = 0
    total = 0
    loss_total = 0
    criterion = nn.MSELoss()
    with torch.no_grad():
        for step, (test_data, test_label) in enumerate(test_loader):
            test_data = test_data.float().to(device)
            test_label = test_label.to(device)
            outputs = snn(test_data)
            _, predicted = outputs.max(1)
            batch_size = test_data.shape[0]
            labels_ = torch.zeros(batch_size, args.n_classes).scatter_(1, test_label.view(-1, 1), 1)
            loss = criterion(outputs.cpu(), labels_)
            loss_total += loss.item()
            total += float(test_label.shape[0])
            correct += float(predicted.eq(test_label.squeeze(-1)).sum().item())
        acc = 100. * correct / total
        return acc, loss_total

# === 训练函数（仅打印日志） ===
def train_snn(snn, args, train_loader, test_loader, device=None):
    acc_record = []
    loss_test_record = []

    snn = snn.apply(init_weights)
    criterion = nn.MSELoss()
    optimizer = torch.optim.Adam(snn.parameters(), lr=args.lr)

    for epoch in range(args.num_epochs):
        running_loss = 0
        total = 0
        correct = 0
        start_time = time.time()
        bar = tqdm.tqdm(total=len(train_loader))

        for step, (input_data, labels) in enumerate(train_loader):
            optimizer.zero_grad()
            batch_size = input_data.shape[0]
            input_data = input_data.float().to(device)
            labels = labels.to(device)
            outputs = snn(input_data)
            _, predicted = outputs.max(1)
            total += float(labels.shape[0])
            correct += float(predicted.eq(labels.squeeze(-1)).sum().item())
            labels_ = torch.zeros(batch_size, args.n_classes).to(device).scatter_(1, labels.view(-1, 1), 1)
            loss = criterion(outputs, labels_)
            running_loss += loss.item()
            loss.backward()
            optimizer.step()
            bar.update(1)

        optimizer = lr_scheduler(optimizer, epoch, args.lr, 10)
        test_acc, test_loss = test_snn(snn, args, test_loader, device=device)
        acc_record.append(test_acc)
        loss_test_record.append(test_loss)

        train_acc = correct / total
        print(f"\nEpoch [{epoch+1}/{args.num_epochs}]")
        print(f"Train Accuracy: {train_acc:.4f}")
        print(f"Test Accuracy : {test_acc:.3f}")
        print(f"Test Loss     : {test_loss:.3f}")
        print(f"Max Accuracy  : {max(acc_record):.3f}")
        print(f"Time Elapsed  : {time.time() - start_time:.2f} sec\n")

    return acc_record, loss_test_record

# === 可视化结果 ===
def print_results(acc_record, loss_test_record):
    import matplotlib.pyplot as plt
    plt.plot(range(len(acc_record)), acc_record)
    plt.xlabel('epoch')
    plt.ylabel('acc[%]')
    plt.show()

    plt.plot(range(len(loss_test_record)), loss_test_record)
    plt.xlabel('epoch')
    plt.ylabel('loss')
    plt.show()
# config.py

# General
fs = 20000
frame_size = 0.01
n_filters = 64
theta = 0.5

# PyTorch training
lr = 3e-3
train_batch_size = 44
eval_batch_size = 22
num_epochs = 50
n_input = n_filters
n_classes = 11
max_time = 150
criterion = "MSE"

# SNN model params
thresh = 0.6
decay = 0.2
MAX_TIME = 130
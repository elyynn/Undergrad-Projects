function main_test()
    % 参数设置
    input_matfile = '../data/TIDIGIT_test.mat';
    output_matfile = '../data/test_output.mat';
    fs = 20000;
    frame_size = 0.01;  % 10ms
    frame_len = round(fs * frame_size);  % 每帧 200 个采样点
    n_filters = 64;

    % 加载数据
    data = load(input_matfile);
    test_samples = data.test_samples;
    test_labels = data.test_labels;

    % 构造滤波器（和离线一样）
    freqs = melScaleFreqs(100, 8000, n_filters);
    [b_all, a_all] = deal(cell(n_filters, 1));
    for i = 1:n_filters
        f1 = freqs(i);
        f2 = freqs(i+1);
        [b, a] = butter(2, [f1 f2]/(fs/2), 'bandpass');
        b_all{i} = b; a_all{i} = a;
    end

    % Initialize output
    encode_labels = test_labels;
    encode_samples = cell(size(test_samples));

    % Loop over samples
    for k = 1:length(test_samples)
        audio = test_samples{k};  % 当前音频样本
        total_len = length(audio);
        T = floor(total_len / frame_len);  % 总帧数

        % 初始化每个滤波器的状态 zi
        zi_all = cell(n_filters, 1);  
        for i = 1:n_filters
            % 初始化滤波器的初始条件zi
            zi_all{i} = zeros(max(length(a_all{i}), length(b_all{i})) - 1, 1);
        end

        % 初始化输出矩阵
        spike_mat = zeros(n_filters, T);

        % 模拟流式处理每一帧
        for t = 1:T
            % 获取当前帧（10ms）
            segment = audio((t-1)*frame_len + 1 : t*frame_len);  % 当前帧
           
            % 每帧实时滤波（对当前帧进行滤波）
            for i = 1:n_filters
                % 滤波器状态 zi 被更新
                [filtered, zi_all{i}] = filter(b_all{i}, a_all{i}, segment, zi_all{i});  
                
                % 整流
                rectified = abs(filtered);
                
                % 初始化膜电位和 spike 计数
                v = 0;
                spike_count = 0;
                theta = 0.5;   % threshold
                
                % 每个采样点处理膜电位
                for s = 1:length(rectified)
                    v = v + rectified(s);
                    if v >= theta
                        spikes = floor(v / theta);
                        spike_count = spike_count + spikes;
                        v = v - spikes * theta;  % 递减膜电位
                    end
                end
                
                % 记录当前频带的 spike 计数
                spike_mat(i, t) = spike_count;
            end
        end

        % 保存当前样本的 spike 数据
        encode_samples{k} = spike_mat;
    end

    % 保存结果
    save(output_matfile, 'encode_samples', 'encode_labels', 'fs');
    disp(['✅ Encoded data saved to ', output_matfile]);
end

function freqs = melScaleFreqs(fmin, fmax, n)
    mel = @(f) 2595 * log10(1 + f/700);
    invmel = @(m) 700 * (10.^(m/2595) - 1);
    mel_points = linspace(mel(fmin), mel(fmax), n + 1);
    freqs = invmel(mel_points);
end
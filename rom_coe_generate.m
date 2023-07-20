% vivado rom ip核coe初始化文件生成
clc,clear;
%% 加载文件
I_channel = readmatrix('I_channel.csv');    %读取I路数据
Q_channel = readmatrix('Q_channel.csv');    %读取Q路数据
minDigits = 16; %比特位宽
%% 十进制转化为二进制
I_channel_bin = dec2bin(I_channel*2^(minDigits-1),minDigits);
Q_channel_bin = dec2bin(Q_channel*2^(minDigits-1),minDigits);
%% 写入COE文件
fid_I = fopen('I_channel.coe','w');
fprintf(fid_I, 'memory_initialization_radix=2;\n');
fprintf(fid_I, 'memory_initialization_vector=\n');
for i=1:size(I_channel_bin,1)-1
    fprintf(fid_I, '%s,\n',I_channel_bin(i,:));
end
fprintf(fid_I, '%s;',I_channel_bin(end,:));
fid_Q = fopen('Q_channel.coe','w');
fprintf(fid_Q, 'memory_initialization_radix=2;\n');
fprintf(fid_Q, 'memory_initialization_vector=\n');
for i=1:size(Q_channel_bin,1)-1
    fprintf(fid_Q, '%s,\n',Q_channel_bin(i,:));
end
fprintf(fid_Q, '%s;',Q_channel_bin(end,:));
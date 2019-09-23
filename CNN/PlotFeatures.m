clc;
clear all;
close all;

load('MnistConv.mat')

k = 1;

x  = X(:, :, k);
y1 = Conv(x, W1);
y2 = ReLU(y1);
y3 = Pool(y2);
y4 = reshape(y3, [], 1);
v5 = W5*y4;
y5 = ReLU(v5);
v  = Wo*y5;
y  = Softmax(v);

figure;
display_network(x(:));
title('input image');

convFilters = zeros(9*9, 20);
for i = 1:20
    filter = W1(:, :, i);
    convFilters(:, i) = filter(:);
end

figure;
display_network(convFilters);
title('Convolution filters');

flist = zeros(20*20, 20);
for i = 1:20
    feature = y1(:, :, i);
    flist(:, i) = feature(:);
end

figure;
display_network(flist);
title('feature [Convolution]');

flist = zeros(20*20, 20);
for i = 1:20
    feature = y2(:, :, i);
    flist(:, i) = feature(:);
end

figure;
display_network(flist);
title('feature [Convolution]+ ReLU');

flist = zeros(10*10, 20);
for i = 1:20
    feature = y3(:, :, i);
    flist(:, i) = feature(:);
end

figure;
display_network(flist);
title('feature [Convolution]+ ReLU + MeanPool');
  

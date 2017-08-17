clear;
clc;
img = imread('data/portraits.jpg');
f_sigma = 10;
g_sigma = 10;
win_size = 30;
res1 = apply_bilateral_filtering(img(:, :, 1), win_size, f_sigma, g_sigma);
res2 = apply_bilateral_filtering(img(:, :, 2), win_size, f_sigma, g_sigma);
res3 = apply_bilateral_filtering(img(:, :, 3), win_size, f_sigma, g_sigma);
n = size(res1,1);
m = size(res1,2);
res = uint8(zeros(n, m, 3));
res(:, :, 1) = res1;
res(:, :, 2) = res2;
res(:, :, 3) = res3;
imshow(img);
figure;
imshow(res);
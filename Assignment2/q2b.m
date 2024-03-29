img = imread('data/other_images/car1.jpg');
n = size(img, 1);
m = size(img, 2);
% Parameters for filters
cutoff = 35;
power = 2;
% Low pass filters
ilpf = ideal_low_pass(cutoff, n, m);
glpf = gauss_low_pass(cutoff, n, m);
blpf = butter_low_pass(cutoff, n, m, power);
% High pass filters 
ihpf = ideal_high_pass(cutoff, n, m);
ghpf = gauss_high_pass(cutoff, n, m);
bhpf = butter_high_pass(cutoff, n, m, power);
% Generate results
res1 = apply_filter_fft(img, ilpf);
res2 = apply_filter_fft(img, blpf);
res3 = apply_filter_fft(img, glpf);
res4 = apply_filter_fft(img, ihpf);
res5 = apply_filter_fft(img, bhpf);
res6 = apply_filter_fft(img, ghpf);
% Display results
figure;imshow(uint8(abs(img)));title('image');
figure;imshow(uint8(abs(res1)));title('ideal low pass');
figure;imshow(uint8(abs(res2)));title('butterworth low pass');
figure;imshow(uint8(abs(res2)));title('gaussian low pass');
imwrite(uint8(abs(res1)),'ilp.jpg');
imwrite(uint8(abs(res2)),'blp.jpg');
imwrite(uint8(abs(res3)),'glp.jpg');
imwrite(uint8(abs(res4)),'ihp.jpg');
imwrite(uint8(abs(res5)),'bhp.jpg');
imwrite(uint8(abs(res6)),'ghp.jpg');
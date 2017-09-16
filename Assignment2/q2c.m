img = imread('data/other_images/yellowlily.jpg');
ri = img(:, :, 1);
gi = img(:, :, 2);
bi = img(:, :, 3);
n = size(ri, 1);
m = size(ri, 2);
lapf = laplacian_fft(n, m);
rr = apply_filter_fft(ri, lapf);
gr = apply_filter_fft(gi, lapf);
br = apply_filter_fft(bi, lapf);
res = img;
res(:, :, 1) = rr;
res(:, :, 2) = gr;
res(:, :, 3) = br;
res = abs(res);
figure;imshow(uint8(img));title('image');
figure;imshow(uint8(res));title('Laplacian');
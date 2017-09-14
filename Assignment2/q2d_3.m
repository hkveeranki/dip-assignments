img = imread('data\notch_pass_reject_filter\notch3.jpg');
n = size(img, 1);
m = size(img, 2);
D = 5;
filter = ones(n, m);
for i = 40:4:n / 2 - 20
    filter = filter .* notch(i, 0 + floor((i / 40)) , n, m, D );
end
for i = n / 2 - 20:4:n - 40
    filter = filter .* notch(i, 0 + floor(((n-i) / 40)) , n, m, D );
end
for i = 40:4:m / 2 - 20
    filter = filter .* notch(floor((i / 40)), i, n, m, D );
end
for i = m / 2 - 20:4:n - 40
    filter = filter .* notch(floor(((m-i) / 40)), i,  n, m, D );
end
ri = apply_filter_fft(img(:, :, 1), filter);
gi = apply_filter_fft(img(:, :, 2), filter);
bi = apply_filter_fft(img(:, :, 3), filter);
res = img;
res(:, :, 1) = abs(ri);
res(:, :, 2) = abs(gi);
res(:, :, 3) = abs(bi);
figure;imshow(uint8(img));
figure;imshow(uint8(abs(res)));
Fc = fftshift(fft2(rgb2gray(img)));
Fcf = fftshift(fft2(rgb2gray(res)));
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])
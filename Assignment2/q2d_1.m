img = imread('data\notch_pass_reject_filter\notch1.png');
n = size(img, 1);
m = size(img, 2);
D = 10;
H1 = notch(210, 18, n, m, D);
H2 = notch(210, 471, n, m, D);
H3 = notch(50, 495, n, m, D);
H4 = notch(50, 40, n, m, D);
H5 = notch(200, 0 , n, m, D);
H6 = notch(60, 0, n, m, D);
filter = H1 .* H2 .* H3 .* H4 .* H5 .* H6;
res = apply_filter_fft(img, filter);
figure;imshow(uint8(img));title('Original Image');
figure;imshow(uint8(abs(res)));title('Filtered Image')
Fc = fftshift(fft2(img));
Fcf = fftshift(fft2(res));
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[]);title('Original image fft')
figure, imshow(S2,[]);title('Filtered image fft')
img = imread('data\notch_pass_reject_filter\notch2.jpg');
n = size(img, 1);
m = size(img, 2);
D = 5;
H1 = notch(13, 23, n, m, D);
H2 = notch(117, 108, n, m, D);
H3 = notch(105, 45, n, m, D);
H4 = notch(27, 87, n, m, D);
H5 = notch(200, 87 , n, m, D);
H6 = notch(60, 87, n, m, D);
H7 = notch(55, 45, n, m, D);
H8 = notch(75, 45, n, m, D);
filter = H1 .* H2 .* H3 .* H4 .* H5 .* H6 .* H7 .* H8;
res = apply_filter_fft(img, filter);
figure;imshow(uint8(img));
figure;imshow(uint8(abs(res)));
Fc = fftshift(fft2(img));
Fcf = fftshift(fft2(res));
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])
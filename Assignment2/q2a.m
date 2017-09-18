img = imread('cameraman.tif');
img = double(padzero(img));
F = get_fft(img, @fft2);
F1 = get_fft(img, @fft_2d);
figure;imshow(F,[]);title('inbuilt FFT');
figure;imshow(F1,[]); title('Custom FFT');
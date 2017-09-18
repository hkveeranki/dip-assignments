function F = get_fft(img, fft_transform)
F = fft_transform(img);
F = fftshift(F);
F = abs(F); 
F = log(F+1); 
F = mat2gray(F);
end
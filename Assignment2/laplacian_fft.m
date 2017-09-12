function filter = laplacian_fft(n, m)
filter = [0 1 0; 1 -4 1; 0 1 0];
next_n = 2 ^ nextpow2(n);
next_m = 2 ^ nextpow2(m);
filter = fftshift(fft2(double(filter), next_n, next_m));
end
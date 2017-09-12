%% Function apply_fillter_fft
% apply the given filter in the fourier domain and return the result
function res = apply_filter_fft(img, filter)
n_init = size(img, 1);
m_init = size(img, 2);
% pad with zeros
img = padzero(img);
img = double(img);
trans = fft_2d(img);
% multiplication in fourier domain is convolution
res = ifft2(ifftshift(fftshift(trans) .* filter));
res = unpad(res, n_init, m_init);
end
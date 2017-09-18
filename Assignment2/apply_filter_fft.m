%% Function apply_fillter_fft
% apply the given filter in the fourier domain and return the result
function res = apply_filter_fft(img, filter)
n_init = size(img, 1);
m_init = size(img, 2);
ndim = size(img, 3);
res = zeros(size(img));
act = img;
% pad with zeros
for i = 1:ndim    
    img = padzero(act(:, :, i));
    img = double(img);
    trans = fft2(img);
    % multiplication in fourier domain is convolution
    fin = ifft2(ifftshift(fftshift(trans) .* filter));
    fin = unpad(fin, n_init, m_init);
    res(:, :, i) = fin;
end
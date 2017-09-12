%% Function fft_rec_1d
% It takes a row vector and returns a row vector which corresponds to
% fft of input matrix
function res = fft_rec_1d(signal)
n = length(signal);
if n == 1
    % Base case
    res = signal;
else
    % Recursive step
    m = n / 2;
    % Divide the signal into odd and even parts
    even_part = signal(1:2:n); % this is because matrices in matlab is 1-indexed
    odd_part = signal(2:2:n);
    % Call FFT on both the parts 
    common_part = fft_rec_1d(even_part);
    res_bottom = fft_rec_1d(odd_part);
    % Multiply the result of odd part by phasor
    phase = (exp(-2 * pi * 1i / n) .^ (0:m-1));
    z = phase .* res_bottom;
    % Concatenate and return result
    res = [common_part + z , common_part - z];
end
end

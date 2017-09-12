%% Function padzero
% Pads the input signal with zeros such that the length will be the next
% power of 2. Equally pads with zeros on both sides if the number of zeros
% needed are odd then padds one more to the right
function res = padzero(signal)
n = size(signal, 1);
m = size(signal, 2);
% Find the dimension which is next power of 2 
next_m = 2 ^ nextpow2(m);
next_n = 2 ^ nextpow2(n);
pad_len_n = round((next_n - n) / 2);
pad_len_m = round((next_m - m) / 2);
signal = padarray(signal, [pad_len_n, pad_len_m]);
% If the difference is odd then remove the beginning row and column
if mod(next_n - n, 2) == 1
    signal(1, :) = [];
end
if mod(next_m - m, 2) == 1
    signal(:, 1) = [];
end
res = signal;
end
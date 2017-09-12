function res = unpad(signal,n,m)
next_n = size(signal, 1);
next_m = size(signal, 2);
pad_len_n = ceil((next_n - n) / 2);
pad_len_m = ceil((next_m - m) / 2);
r_r = mod(next_n - n , 2);
r_c = mod(next_m - m , 2);
res = signal(pad_len_n + 1 - r_r :next_n - pad_len_n ,pad_len_m + 1- r_c :next_m - pad_len_m);
end
function filter = gauss_low_pass(cutoff, n, m)
n = 2 ^ nextpow2(n);
m = 2 ^ nextpow2(m);
filter = zeros(n, m);
x = n / 2;
y = m / 2;
cutoff = cutoff * cutoff;
for i = 1:n
    i_d = (i - x) * (i - x);
    for j = 1:m
        j_d = (j - y)* (j - y);
       filter(i, j) = exp(-(i_d + j_d)/2*cutoff);
    end
end
end
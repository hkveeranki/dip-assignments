function filter = gauss_high_pass(cutoff, n, m)
n = 2 ^ nextpow2(n);
m = 2 ^ nextpow2(m);
filter = zeros(n, m);
x = n / 2;
y = m / 2;
cutoff = 2 * cutoff * cutoff;
for i = 1:n
    i_d = (i - x) * (i - x);
    for j = 1:m
        j_d = (j - y)* (j - y);
       filter(i, j) = 1 - exp(-(i_d + j_d)/cutoff);
    end
end
end
function filter = butter_low_pass(cutoff, n, m, power)
n = 2 ^ nextpow2(n);
m = 2 ^ nextpow2(m);
filter = zeros(n, m);
x = n / 2;
y = m / 2;
for i = 1:n
    i_d = (i - x) * (i - x);
    for j = 1:m
        j_d = (j - y)* (j - y);
       filter(i, j) = 1/(1+(sqrt(i_d + j_d)/cutoff)^2 * power);
    end
end
end
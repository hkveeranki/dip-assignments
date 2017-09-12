function filter = ideal_low_pass(cutoff, n, m)
n = 2 ^ nextpow2(n);
m = 2 ^ nextpow2(m);
filter = zeros(n, m);
x = n / 2;
y = m / 2;
for i = 1:n
    for j = 1:m
        if sqrt((i - x) * (i - x) + (j - y) * (j - y)) <= cutoff
            filter(i, j) = 1;
        end
    end
end
filter = double(filter);
end
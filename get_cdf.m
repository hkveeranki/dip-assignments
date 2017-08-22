function cdf = get_cdf(img, L)
cdf = zeros(L, 1);
n = size(img, 1);
m = size(img, 2);
for i = 1:n
    for j = 1:m
        val = img(i, j) + 1;
        cdf(val) = cdf(val) + 1;
    end
end
for i = 2:L
    cdf(i) = cdf(i) + cdf(i - 1);
    cdf(i - 1) = cdf(i - 1) / (n * m);
end
cdf(L) = cdf(L) / (n * m);
end
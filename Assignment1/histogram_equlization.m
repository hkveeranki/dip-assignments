function map = histogram_equlization(img)
L = 256;
map = zeros(L, 1);
cdf = get_cdf(img, L);
for i = 1:L
    cdf(i) = cdf(i) / (n*m);
    new_val = floor((L - 1) * cdf(i) + 0.5);
    map(i) = uint8(new_val);
end
end
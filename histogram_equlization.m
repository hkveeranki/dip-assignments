function map = histogram_equlization(img)
L = 256;
map = zeros(L, 1);
cdf = zeros(L, 1);
n = size(img, 1);
m = size(img, 2);
for i = 1:n
    for j = 1:m
        val = img(i, j) + 1;
        cdf(val) = cdf(val) + 1;
    end
end
for i = 2:256
    cdf(i) = cdf(i) + cdf(i - 1);
end 
for i = 1:256
    cdf(i) = cdf(i) / (n*m);
    new_val = floor((L - 1) * cdf(i) + 0.5);
    map(i) = uint8(new_val);
end
end
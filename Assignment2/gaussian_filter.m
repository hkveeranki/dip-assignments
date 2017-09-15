function filter = gaussian_filter(win_size, sigma)
filter = zeros(win_size);
lim = floor(win_size / 2);
pow_den = 2 * sigma * sigma;
den = (pow_den * pi);
for i = 1:win_size
    for j = 1:win_size
        x = i - lim - 1;
        y = j - lim - 1;
        pow = (x * x + y * y) / (pow_den);
        filter(i,j) = exp(-pow) / den;
    end
end
filter = filter / (sum(filter(:)));
end
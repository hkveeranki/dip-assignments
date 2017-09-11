function res = apply_median_filter(img, win_size)
res = uint8(zeros(size(img)));
lim = floor(win_size / 2);
n = size(img, 1);
m = size(img, 2);
mid = ceil((win_size * win_size) / 2);
img = padarray(img, [lim,lim], 'both', 'symmetric');
for i = lim + 1:n + lim
    for j = lim + 1:m + lim
        temp = zeros(win_size * win_size, 1);
        ind = 1;
        for x = -lim:lim
            for y = -lim:lim
                temp(ind) = img(i - x, j - y);
                ind = ind + 1;
            end
        end
        temp = sort(temp);
        res(i - lim, j - lim) = temp(mid);
    end
end
end
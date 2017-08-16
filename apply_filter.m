function res = apply_filter(img, filter)
res = uint8(zeros(size(img)));
win_size = size(filter,1);
lim = floor(win_size / 2);
n = size(img, 1);
m = size(img, 2);
img = padarray(img,[lim, lim]);
for i = lim + 1:n + lim
    for j = lim + 1:m+ lim
        temp = zeros(win_size);
        for x = 1:win_size
            for y = 1:win_size
                x_ind = i + (x - lim - 1);
                y_ind = j + (y - lim - 1);
                temp(x, y) = img(x_ind, y_ind) * filter(x,y);
            end
        end
        res(i- lim ,j - lim ) = round(sum(temp(:)));
    end
end
end
function res = apply_filter(img, filter)
res = zeros(size(img));
win_size = size(filter,1);
lim = floor(win_size / 2);
img = padarray(img,[lim, lim]);
n = size(img, 1);
m = size(img, 2);
img = double(img);
for i = 1 : n - win_size + 1
    for j = 1 : m - win_size + 1
        temp = img(i:i+win_size - 1, j:j+win_size -1).*filter;
        res(i,j) = uint8(sum(temp(:)));
    end
end
res = uint8(res);
end
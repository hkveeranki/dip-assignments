function res = apply_filter(img, filter)
res = uint8(zeros(size(img)));
win_size = size(filter,1);
lim = floor(win_size / 2);
padimg = padarray(img,[lim, lim]);
n = size(padimg, 1);
m = size(padimg, 2);
padimg = double(padimg);
for i = 1 : n - win_size + 1
    for j = 1 : m - win_size + 1
        temp = padimg(i:i+win_size - 1, j:j+win_size -1).*filter;
        res(i,j) = uint8(sum(temp(:)));
    end
end
if size(res,1) > size(img,1)
    res(end, :) = [];
    res(:, end) = [];
end
end
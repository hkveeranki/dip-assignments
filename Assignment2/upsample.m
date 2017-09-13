function res = upsample(img, myinterp)
img = double(img);
n = size(img, 1);
m = size(img, 2);
res = zeros(2*n, 2*m, size(img,3));

for i = 1:n
    for j = 1:m
        neigh = myinterp(img, i, j, n, m);
        res(2 * i - 1, 2 * j - 1, :) = img(i, j,:);
        res(2 * i - 1, 2 * j, :) = neigh(1, 1,:);
        res(2 * i, 2 * j - 1, :) = neigh(1, 2, :);
        res(2 * i, 2 * j, :) = neigh(1, 3, :);
    end
end
res = uint8(round(res));
end
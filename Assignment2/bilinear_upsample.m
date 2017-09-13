function res = bilinear_upsample(img, M)
x_size = size(img, 1);
y_size = size(img, 2);
z_size = size(img, 3);
res = zeros(M * x_size, M * y_size, z_size);
for i = 1 : M*x_size
    x1 = floor((i-1) / M) + 1;
    x2 = ceil((i-1) / M) + 1;
    a = ((i - 1)/M ) - (x1-1);
    for j = 1:M*y_size
        y1 = floor((j - 1) / M) + 1;
        y2 = ceil((j - 1) / M) + 1;
        b = ((j-1)/M) - (y1-1);
        res(i, j, :) = (1-a)*(1-b) * get_val(img, x1, y1, x_size, y_size);
        res(i, j, :) = res(i, j, :) + (1 - a) * b * get_val(img, x1, y2, x_size, y_size);
        res(i, j, :) = res(i, j, :) + a * (1 - b) * get_val(img, x2, y1, x_size, y_size);
        res(i, j, :) = res(i, j, :) + a * b * get_val(img, x2, y2, x_size, y_size);
    end
end
end
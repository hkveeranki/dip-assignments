function res = bicubic_upsample(img, M)
x_size = size(img, 1);
y_size = size(img, 2);
z_size = size(img, 3);
res = zeros(M * x_size, M * y_size, z_size);
for i = 1 : M*x_size
    x1 = floor((i - 1) / M) + 1;
    b = ((i - 1) / M) - (x1 - 1);
    for j = 1:M*y_size
        y1 = floor((j - 1) / M) + 1;
        a = ((j - 1)/M) - (y1 - 1);
        res(i, j, :) = -a * (1 - a)^2 * f(img, x1, y1 - 1, b, x_size, y_size);
        res(i, j, :) = res(i, j , :) + (1 - 2 * a ^ 2 + a ^ 3) * f(img, x1, y1, b, x_size, y_size);
        res(i, j, :) = res(i, j , :) + a * (1 + a - a ^ 2) * f(img, x1, y1 + 1, b, x_size, y_size);
        res(i, j, :) = res(i, j , :) - ( a^2 *(1 - a) * f(img, x1, y1 + 2, b, x_size, y_size));
    end
end
end

function val = f(img, m, n, b, x_size, y_size)
val = -b * ((1 - b )^2) * get_val(img, m - 1, n, x_size,y_size);
val = val + (1 - 2 * b ^ 2 + b ^ 3) * get_val(img, m, n, x_size, y_size);
val = val + b * (1 + b - b ^ 2) * get_val(img, m + 1, n, x_size, y_size);
val = val - ((b ^ 2) * (1 - b) * get_val(img, m + 2, n, x_size, y_size));
end
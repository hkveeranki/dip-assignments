function res = linear_upsample(img, M)
x_size = size(img, 1);
y_size = size(img, 2);
z_size = size(img, 3);
res = zeros(M * x_size, M * y_size, z_size);
for i = 1 : M*x_size
    x = (i-1) / M;
    x1 = floor((i-1) / M) + 1;
    x2 = ceil((i-1) / M) + 1;
    for j = 1:M*y_size
        y = (j - 1) / M;
        y1 = floor((j - 1) / M) + 1;
        y2 = ceil((j - 1) / M) + 1;
        sx = x1;
        sy = y2;
        if dist(x,y,x1,y2) > dist(x, y, x2, y1)
            sx = x2;
            sy = y1;
        end
        d1 = sqrt(dist(x, y, x1, y1));
        d2 = sqrt(dist(x, y, sx, sy));
        a = d1/(d1+d2);
        res(i, j, :) = a * get_val(img, sx, sy, x_size, y_size);
        res(i, j, :) = res(i, j, :) + (1 - a) * get_val(img, x1, y1, x_size, y_size);
    end
end
end

function val = dist(x1, y1, x2, y2)
val = (x1 - x2)*(x1 - x2);
val = val + (y1 - y2) * (y1 - y2);
end
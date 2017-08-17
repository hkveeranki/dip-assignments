function res = apply_ripple_transform(img, ax, ay, tx, ty)
n = size(img, 1);
m = size(img, 2);
res = uint8(zeros(n, m));
for i = 1:n
    for j = 1:m
        x_t = i + ax * sin(2*pi*j / tx);
        y_t = j + ay * sin(2*pi*i / ty);
        x_t = round(x_t);
        y_t = round(y_t);
        if x_t >= 1 && x_t <= n && y_t >= 1 && y_t <= m
            res(i, j) = img(x_t, y_t);
        end
    end
end
end
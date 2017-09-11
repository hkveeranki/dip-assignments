function res = apply_transform(img, mat)
res = uint8(zeros(size(img)));
n = size(img, 1);
m = size(img, 2);
for i = 1:n
    for j = 1:m
        inp = [i; j;  1];
        out = mat * inp;
        out_x = out(1, 1) / out(3, 1);
        out_y = out(2, 1) / out(3, 1);
        out_x = round(out_x);
        out_y = round(out_y);
        if out_x <= n && out_x >= 1  && out_y <= m && out_y >= 1
            res(i, j) = img(out_x, out_y);
        end
    end
end
end
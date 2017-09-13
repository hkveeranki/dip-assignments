function res = nn_upsample(img, M)
x_size = size(img, 1);
y_size = size(img, 2);
z_size = size(img, 3);
res = zeros(M * x_size, M * y_size, z_size);
for i = 1 : M*x_size
    x = floor((i-1) / M) + 1;
    for j = 1:M*y_size
        y = floor((j-1) / M) + 1;
        for k = 1:z_size
            res(i, j, k) = img(x, y, k);
        end
    end
end
end
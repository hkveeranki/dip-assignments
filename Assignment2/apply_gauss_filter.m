function res = apply_gauss_filter(img)
res = zeros(size(img));
dim = size(img, 3);
n = size(img, 1);
m = size(img, 2);
filter = gaussian_filter(5, 0.5);
for i = 1:dim
    res(:, :, i) = apply_filter(img(:, :, i), filter);
end
end
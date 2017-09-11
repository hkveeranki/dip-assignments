function res = apply_intensity_map(img, map)
res = img;
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        val = img(i, j) + 1;
        res(i,j) = map(val) - 1;
    end
end

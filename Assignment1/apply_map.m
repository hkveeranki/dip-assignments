function res = apply_map(img, map)
res = uint8(zeros(size(img)));
for i=1:size(img, 1)
    for j=1:size(img, 2)
        res(i, j) = map(img(i, j) + 1) - 1;
    end
end
end
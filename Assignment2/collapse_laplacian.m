function results = collapse_laplacian(pyramid, upsample)
levels = length(pyramid) - 1;
results = cell(1,levels + 1);
res = pyramid{levels + 1};
results{levels + 1} = res;
for i = levels:-1:1
    upi = upsample(res, 2);
    upi = imgaussfilt(upi);
    rows = size(pyramid{i}, 1);
    cols = size(pyramid{i}, 2);
    upi = upi(1:rows, 1:cols, :);
    res = upi + pyramid{i};
    figure;imshow(uint8(res));
    results{i} = uint8(res);
end
end
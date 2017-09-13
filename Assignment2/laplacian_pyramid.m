function pyramid = laplacian_pyramid(img, levels)
gauss_pyr = gaussian_pyramid(img, levels);
pyramid = cell(1, levels + 1);
for i = 1:levels
    upi = expand(gauss_pyr{i+1},@cubic_interp);
    rows = size(gauss_pyr{i}, 1);
    cols = size(gauss_pyr{i}, 2);
    upi = upi(1:rows, 1:cols, :);
    pyramid{i} = gauss_pyr{i} - upi;
end
pyramid{end} = gauss_pyr{end};
end
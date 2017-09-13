function pyramid = laplacian_pyramid(img, levels)
pyramid = cell(1,levels + 1);
res = img;
for i = 1:levels
    blur = imgaussfilt(res);
    pyramid{i} = res - blur;
    res = blur(1:2:end, 1:2:end, :);
end
pyramid{levels + 1} = res;
end
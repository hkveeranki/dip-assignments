function pyramid = gaussian_pyramid(img, levels)
img = double(img);
pyramid = cell(1,levels + 1);
res = img;
pyramid{1} = res;
for i = 1:levels
    blur = imgaussfilt(res);
    res = blur(1:2:end, 1:2:end, :);
    pyramid{i+1} = res;
end
end
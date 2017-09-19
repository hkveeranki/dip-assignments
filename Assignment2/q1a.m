img = imread('data/other_images/pears.png');
n = size(img, 1);
m = size(img, 2);
levels = min(6, floor(log(min(n, m)) / log(2)));
laplacian_pyr = laplacian_pyramid(img, levels);
img = imread('data/Einstein.jpg');
res = img;
win_size = 2;
res1 = apply_median_filter(img(:,:,1),win_size);
res2 = apply_median_filter(img(:,:,2), win_size);
res3 = apply_median_filter(img(:,:,3), win_size);
res(:,:,1) = res1;
res(:,:,2) = res2;
res(:,:,3) = res3;
imshow(img);
figure;
imshow(res);
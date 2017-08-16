img = imread('data/bell.jpg');
filter = gaussian_filter(5, 1.76);
res1 = apply_filter(img(:,:,1), filter);
res2 = apply_filter(img(:,:,2), filter);
res3 = apply_filter(img(:,:,3), filter);
res(:,:,1) = res1;
res(:,:,2) = res2;
res(:,:,3) = res3;
imshow(img);
figure;
imshow(res);
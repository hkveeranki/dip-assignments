img = imread('data/gm1.jpg');
res = uint8(zeros(size(img)));
n = size(img, 1);
m = size(img, 2);
ax = 2*n/100;
ay = 2*m/100;
tx = n/5;
ty = m/5;
res1 = apply_ripple_transform(img(:, :, 1), ax, ay, tx, ty);
res2 = apply_ripple_transform(img(:, :, 2), ax, ay, tx, ty);
res3 = apply_ripple_transform(img(:, :, 3), ax, ay, tx, ty);
res(:,:,1) = res1;
res(:,:,2) = res2;
res(:,:,3) = res3;
figure;
title('Original Image');
imshow(img);
figure;
title('Rippled');
imshow(res);
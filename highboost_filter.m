function highboost_filter(img_file)
img = imread(img_file);
res = img;
filter = gaussian_filter(3, 1.76);
res1 = apply_filter(img(:,:,1), filter);
res2 = apply_filter(img(:,:,2), filter);
res3 = apply_filter(img(:,:,3), filter);
res(:,:,1) = res1;
res(:,:,2) = res2;
res(:,:,3) = res3;
edges = img - res;
figure; title('Original');
imshow(img);
figure; title('edges');
imshow(edges);
sharp = img + 8 * edges;
figure;title('sharpen');
imshow(sharp);
end
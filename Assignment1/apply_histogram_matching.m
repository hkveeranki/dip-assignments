function apply_histogram_matching(img1, img2)
map = histogram_matching(img1, img2);
res = apply_map(img1, map);
figure;imhist(res);title('result hist');
figure; imshow(img1); title('Image1');
figure; imshow(img2); title('Image2');
figure; imshow(res); title('Result');
end

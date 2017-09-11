function display_results_hist_equal(image_file, win_size)
img = imread(image_file);
red_res = local_histogram_equalization(img(:, :, 1), win_size);
green_res = local_histogram_equalization(img(:, :, 2), win_size);
blue_res = local_histogram_equalization(img(:, :, 3), win_size);
res = img;
res(:, :, 1) = red_res;
res(:, :, 2) = green_res;
res(:, :, 3) = blue_res;
figure;
imshow(img);
figure;
imshow(res);
end
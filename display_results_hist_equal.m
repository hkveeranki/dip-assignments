function display_results_hist_equal(image_file)
img = imread(image_file);
win_len = 30;
win_wid = 30;
red_res = local_histogram_equalization(img(:, :, 1), win_len, win_wid);
green_res = local_histogram_equalization(img(:, :, 2), win_len, win_wid);
blue_res = local_histogram_equalization(img(:, :, 3), win_len, win_wid);
res = img;
res(:, :, 1) = red_res;
res(:, :, 2) = green_res;
res(:, :, 3) = blue_res;
figure;
imshow(img);
figure;
imshow(res);
end
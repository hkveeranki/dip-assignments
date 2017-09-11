img1 = rgb2gray(imread('data/hist_match.jpg'));
img2 = rgb2gray(imread('data/moon_match.jpg'));
img3 = rgb2gray(imread('data/hist_equal3.jpg'));
img4 = rgb2gray(imread('data/bilateral1.jpg'));
%apply_histogram_matching(img2, img1);
 apply_histogram_matching(img3, img1);
% apply_histogram_matching(img4, img1);
% apply_histogram_matching(img4, img2);

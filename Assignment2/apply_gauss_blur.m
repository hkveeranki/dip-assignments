function res = apply_gauss_blur(img)
filter = gaussian_filter(5, 0.5);
res = imfilter(img, filter);
end
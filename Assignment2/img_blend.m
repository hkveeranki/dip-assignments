function results = img_blend(bg, fg, mask, upsample)
n = size(bg,1);
m = size(bg, 2);
levels = floor(log(min(n,m))/log(2));
blp = laplacian_pyramid(bg, levels);
flp = laplacian_pyramid(fg, levels);
mgp = gaussian_pyramid(mask, levels);
resultp = cell(1,levels + 1);
for i = levels+1:-1:1
    res = mgp{i} .* flp{i} + (1 - mgp{i}).*blp{i};
    resultp{i} = res;
end
results = collapse_laplacian(resultp, upsample);
end
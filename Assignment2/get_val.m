function val = get_val(img, x, y, n, m)
val = 0;
if x <=n && x>=1 && y <= m && y >= 1
    val = img(x, y, :);
end
end
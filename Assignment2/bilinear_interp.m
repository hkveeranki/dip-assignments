function val = bilinear_interp(img, i, j, n, m)
    val = zeros(1,3,size(img,3));
    val(1,1,:) = (get_val(img, i, j, n, m) + get_val(img, i, j + 1, n, m))/2;
    val(1,2,:) = (get_val(img, i, j, n, m) + get_val(img, i + 1, j, n, m))/2;
    val(1,3,:) = (get_val(img, i, j, n, m) + get_val(img, i + 1, j, n, m) + get_val(img, i, j + 1, n, m) + get_val(img, i + 1, j + 1, n, m))/4;
end
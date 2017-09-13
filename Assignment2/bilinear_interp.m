function val = bilinear_interp(img, i, j, n, m)
    val = zeros(1,3,size(img,3));
    val(1,1,:) = (gv(img, i, j, n, m) + gv(img, i, j + 1, n, m))/2;
    val(1,2,:) = (gv(img, i, j, n, m) + gv(img, i + 1, j, n, m))/2;
    val(1,3,:) = (gv(img, i, j, n, m) + gv(img, i + 1, j, n, m) + gv(img, i, j + 1, n, m) + gv(img, i + 1, j + 1, n, m))/4;
    val = uint8(ceil(val));
end
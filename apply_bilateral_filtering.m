function res = apply_bilateral_filtering(img, win_size, f_sigma, g_sigma)
res = img;
lim = floor(win_size / 2);
n = size(img, 1);
m = size(img, 2);
padimg = double(img);
f_den = (2 * f_sigma * f_sigma);
g_den = (2 * g_sigma * g_sigma);
for i = lim + 1 : n - lim
    for j = lim + 1 : m - lim
        i_p = padimg(i,j);
        val = 0;
        N = 0;
        for x = -lim:lim
            for y = -lim:lim
                if lim ~= 0
                    i_d = padimg(i + x , j + y) - i_p;
                    dis = x * x + y * y;
                    term = exp(-(dis)/(g_den) - (i_d * i_d)/(f_den));
                    val = val + term * padimg(i + x, j + y);
                    N = N + term;
                end
            end
        end
        val = val / N;
        res(i, j) = uint8(val);
    end
end
if size(res,1) > size(img,1)
    res(end, :) = [];
    res(:, end) = [];
end
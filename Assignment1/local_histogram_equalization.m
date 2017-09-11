function res = local_histogram_equalization(img, win_size)
L = 255;
res = img;
n = size(img, 1);
m = size(img, 2);
lim = floor(win_size / 2);
for i = 1:n
    for j = 1:m
        Tr = zeros(256,1);
        ind = 1;
        x_start = max(1, i - lim);
        x_end = min(n, i + lim);
        y_start = max(1, j - lim);
        y_end = min(m, j + lim);
        for x = x_start:x_end
            for y = y_start:y_end
                val = img(x, y) + 1;
                Tr(val) = Tr(val) + 1;
                ind = ind + 1;
            end
        end
        for c = 2:256
            Tr(c) = Tr(c-1) + Tr(c);
        end
        res(i, j) = floor((Tr(img(i, j) + 1) / (win_size * win_size)) * 255 + 0.5);
    end
end
end
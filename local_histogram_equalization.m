function res = local_histogram_equalization(img, win_len,win_wid)
L = 255;
res = img;
in=0;
mid = win_len * win_wid;
mid = round(mid / 2);
pad_len = 0;
pad_wid = 0;
for i = 1:win_len
    for j = 1:win_wid
        in=in+1;
        if(in == mid)
            pad_len = i-1;
            pad_wid = j-1;
            break;
        end
    end
end
img = padarray(img,[pad_len, pad_wid]);
n = size(img, 1);
m = size(img, 2);
x_lim = round(n - (2*pad_len + 1));
y_lim = round(m - (2*pad_wid + 1));
for i = 1:x_lim
    for j = 1:y_lim
        Tr = zeros(256,1);
        ind = 1;
        ele = uint8(0);
        for x = 1:win_len
            for y = 1:win_wid
                x_ind = i + x - 1;
                y_ind = j + y - 1;
                if(ind == mid)
                    ele = img(x_ind, y_ind) + 1;
                end
                val = img(x_ind, y_ind) + 1;
                Tr(val) = Tr(val) + 1;
                ind = ind + 1;
            end
        end
        for c = 2:256
            Tr(c) = Tr(c-1) + Tr(c);
        end
        res(i,j) = floor((Tr(ele) / (pad_len * pad_wid)) * 255 + 0.5);
    end
end
end
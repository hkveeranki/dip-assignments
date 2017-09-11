function map = histogram_matching(img1, img2)
L = 256;
cdf1 = get_cdf(img1, L);
cdf2 = get_cdf(img2, L);
figure;imhist(img1);title('hist1');
figure;imhist(img2);title('hist2');
map = zeros(L, 1);
j = 1;
for i = 1:L
    if (cdf1(i) <= cdf2(j))
        map(i) = j;
    else
        while(cdf1(i) > cdf2(j))
            j = j+1;
        end
        map(i) = j;
        if (cdf2(j) - cdf1(i) > cdf1(i) - cdf2(j - 1))
            j = j - 1;
        end
    end
end
end
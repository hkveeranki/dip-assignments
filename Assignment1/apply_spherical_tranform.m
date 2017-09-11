function res = apply_spherical_tranform(img, xc, yc, rmax, p)
n = size(img, 1);
m = size(img, 2);
res = img;
for i = 1:n
    for j = 1:m
        xd = 0;
        yd = 0;
        dx = i - xc;
        dy = j - yc;
        dsq = dx * dx + dy * dy;
        dist = sqrt(dsq);
        if dist <= rmax
            z = sqrt(rmax * rmax - dsq);
            betax = (1 - (1/p))*(asin(dx/(sqrt(dx * dx + z*z))));
            betay = (1 - (1/p))*(asin(dy/(sqrt(dy * dy + z*z))));
            xd = z * tan(betax);
            yd = z * tan(betay);
        end
        x_t = round(i - xd);
        y_t = round(j - yd);  
        if x_t >= 1 && x_t <= n && y_t >= 1 && y_t <= m
         res(i, j) = img(x_t, y_t);  
        end 
    end
end
end

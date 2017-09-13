function val = nn_interp(img, i, j, ~, ~)
val = zeros(1,3, size(img, 3));
val(1, 1, :) = img(i, j, :);
val(1, 2, :) = img(i, j, :);
val(1, 3, :) = img(i, j, :);
val = uint8(val);
end
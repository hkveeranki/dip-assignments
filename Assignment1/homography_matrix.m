% Method followed here is described in http://www.robots.ox.ac.uk/~vgg/presentations/bmvc97/criminispaper/node3.html
function mat = homography_matrix(input, output)
n = size(input, 2);
inp_x = input(1, :);
inp_y = input(2, :);
out_x = output(1, :);
out_y = output(2, :);
zeros_mat = zeros(3, n);
H_c = -[inp_x; inp_y; ones(1, n)];
H_x = [H_c; zeros_mat; out_x.*inp_x; out_x.*inp_y; out_x];
H_y = [zeros_mat; H_c; out_y.*inp_x; out_y.*inp_y; out_y];
H = [H_x H_y];
[U s v] = svd(H);
mat = (reshape(U(:, 9), 3, 3)).';
end
%% Function ff_2d
% 
% Takes a 2D signal (for example an image) and returns the fft of the input
% matrix.  Assumes that signal length and breadth are 2-powers
% We iterate over the rows and generate the 1D DFT of the rows.
% Then we iterate over the columns and do the same. The resultant is the
% DFT of the 2D signal;
function res = fft_2d(signal)
n = size(signal, 1);
m = size(signal, 2);
% Row wise FFT 
for i = 1:n
    signal(i,:) = fft_rec_1d(signal(i,:));
end
% Column wise FFT 
for i = 1:m
    signal(:,i) = fft_rec_1d(signal(:,i).').';
end
% Assigning to results 
res = signal;
end
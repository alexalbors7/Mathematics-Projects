%% Approximations of the Minkowsky-Bouligand Dimension
% Approximating the smallest number of epsilon box coverings of the set {1,
% 1/2, 1/3, ...} in the real line.
close all; clc;

figure 
hold on
N = 10;
vals = zeros(1, 2^(N-2));
for i = linspace(1, 2^N, 2^(N-2))
    
    plot(i, coverings(i), 'xr');
    plot(i, 1.85*sqrt(i), 'xg')
end

% Figure graphs number of boxes needed against the size of N, with epsilon being 1/N. 
% It is of the order of N = sqrt(1/size of epsilon), which gives an idea
% about why the fractal dimension of the set is 1/2. 


% We let epsilon be given, and take the form 1/N, N being a positive
% integer. Then, the first box can cover all points in the set in [0, 1/N].
% Then, the second box, starting at 1/(N-1) can cover up to 1/k, with k = floor(...),
% as shown in the function. When we arrive at k = 1, we've reached 1/1,
% which is the last point. We return the count of boxes used.
function out = coverings(N)
k = N; count = 1;
while (k > 1)
 k = floor(1/(1/N + 1/k));
 count = count + 1;
end
out = count;
end
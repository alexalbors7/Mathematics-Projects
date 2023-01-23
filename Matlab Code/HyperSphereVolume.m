%% HW 3 Monte Carlo Integration Math335
% Approximating the volume of hyperspheres through Monte Carlo methods.


% Plotting volumes from 1,...,20-dimensional hyperspheres.
% Peak in 5 dimensions.

m = 20;
info = zeros(m, 1);
for k = 1:m
    info(k, 1) = ksphere(1e6, k, 2);
end

figure(1)
plot(1:m, info(1:m, 1), 'ro', 'MarkerSize', 10);
hold on
plot(1:m, info(1:m, 1), '--', 'Color', 'b');
title("Volume of n-dimensional hypersphere");
xlabel("Dimension");
ylabel("Volume");
grid on

% The error is of the order 1/sqrt(n).
%% Let's try now with 4th powers in R-3:



info = zeros(m, 1);
for k = 1:m
    info(k, 1) = ksphere(1e5, k, 4);
end

figure(2)
plot(1:m, info(1:m, 1), 'ro', 'MarkerSize', 10);
hold on
plot(1:m, info(1:m, 1), '--', 'Color', 'b');
title("Volume of n-dimensional 3-hypersphere");
xlabel("Dimension");
ylabel("Volume");
grid on



%%

P1Vol = ksphere(1e7, 3, 4);





function Volume = ksphere(n,d,k)

% Generate uniformly distributed points in 
% [0, 1]^d
points = rand(n, d)*2-1; 

powers = points(:,:).^k;

% Sums all elements raised to the kth power across 2nd dimension, so sums
% along the columns. Thus, only rows remain and we have
% x_1^k+x_2^k+...+x_n^k in each row for each point (x_1,x_2,...,x_n)
% only adds them to the sum if they are less than one. That is, if that
% point is contained in the desired set. Then divides by total number of
% points to see how many points are in vs out.
frac1 = sum(sum(powers, 2) <= 1)/n;

% Could also compare point by point:
count = 0;
pointSum = sum(powers, 2);
for i=1:n
    if (pointSum(i) <= 1)
        count = count + 1;
    end
end
frac2 = count/n;

% 2^d represents the volume of the d-cube we sample our points from. Thus, volume
% of hypersphere is volume of the d-cube times fraction of points in vs
% points out.
% Return a row vector w two different ways of computing the fraction.
Volume = [frac1, frac2]*(2^d); 

end

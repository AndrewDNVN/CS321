% Project 1 
% Andrew Donovan
% CS 321
% Runner code

n = 3;
A = randn(n,n);

%our goal result for Gaussian functions
Goal_Result = [1;2;3];

%b is found by multiplying A and our goal result
b = zeros(1,n);
b = A * Goal_Result;

outP1 = Gauss_Naive(A, b);

outP2 = Gauss_Pivoted(A, b);

r_Naive = (A * outP1) - b;
r_Pivoted = (A * outP2) - b;

norm_Naive = norm(r_Naive)
norm_Pivoted = norm(r_Pivoted)





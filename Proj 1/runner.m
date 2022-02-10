% Project 1 
% Andrew Donovan
% CS 321
% Runner code
format long
n = 10000;
A = randn(n,n);

%our goal result for Gaussian functions
b = randn(n);

% run calculations using Naive Gauss
outP1 = Gauss_Naive(A, b);

% run calculations using Pivoted Gauss
outP2 = Gauss_Pivoted(A, b);

% calculate the residual vector for naive gauss
r1 = (A * outP1) - b;

% calculate the residual vector for Pivoted Gauss
r2 = (A * outP2) - b;

% norm the outputs and compare
norm_Naive = norm(r1);
norm_Pivoted = norm(r2);

% Print out performance of the methods to the terminal

if (norm_Naive > norm_Pivoted)
    fprintf("The Naive Gaussian Elemination had a larger normilized value.\n");
    fprintf("The Naive Gaussian normlized value:\t\t %d \n", norm_Naive);
    fprintf("The Pivoted Gaussian normlized value:\t %d \n", norm_Pivoted);

elseif (norm_Naive < norm_Pivoted)
    fprintf("The Naive Gaussian Elemination had a smaller normilized value.\n");
    fprintf("The Naive Gaussian normlized value:\t\t %d \n", norm_Naive);
    fprintf("The Pivoted Gaussian normlized value:\t %d \n", norm_Pivoted);

elseif (norm_Naive == norm_Pivoted)
    fprintf("The Naive Gaussian Elemination had the same normilized value.\n");
    fprintf("The Naive Gaussian normlized value:\t\t %d \n", norm_Naive);
    fprintf("The Pivoted Gaussian normlized value:\t %d \n", norm_Pivoted);

end

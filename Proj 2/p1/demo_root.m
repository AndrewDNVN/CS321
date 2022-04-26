
% Author: Andrew Donovan
% See ReadMe.md for explaintion and other notes
% All outputs are in the readme


format long

% set up of function and values
% also derivatives precalculated

% function 1 e^x-sin(x)
f1 = @(x) exp(x)-sin(x);
f1_df = @(x) exp(x)-cos(x);
f1_x0 = -10;
f1_x1 = 0;
f1_err = 1e-4;

% function 2 (x-1)^3
f2 = @(x)(x-1)^3;
f2_df = @(x) 3*(x-1)^2;
f2_x0 = 0;
f2_x1 = 2;
f2_err = 1e-4;

% function cube root of (x-1) || (x-1)^(1/3)
f3 = @(x)(x-1)^(1/3);
f3_df = @(x) 1 / (3*(x-1)^(2/3));
f3_x0 = 0;
f3_x1 = 2;
f3_err = 1e-4;


% bisection method section
bisection_f1 = root_bisect(f1, f1_x0, f1_x1, f1_err);

bisection_f2 = root_bisect(f2, f2_x0, f2_x1, f2_err);

bisection_f3 = root_bisect(f3, f3_x0, f3_x1, f3_err);


% newtons method section
newton_f1 = root_newton(f1, f1_x0, f1_df, f1_err);

newton_f2 = root_newton(f2, f2_x0, f2_df, f2_err);

newton_f3 = root_newton(f3, f3_x1, f3_df, f3_err);


% secant method section
secant_f1 = root_secant(f1, f1_x0, f1_x1, f1_err)

secant_f2 = root_secant(f2, f2_x0, f2_x1, f2_err)

secant_f3 = root_secant(f3, f3_x0, f3_x1, f3_err)





close all; clear; clc;

n = 5;             % polynomial degree

fx = @(x) 1./(1 + 25*x.^2); 
a = -1; b = 1;


% ------------------------------
% 1. Define interpolating points
xdata = linspace(a,b,n+1)';     % equal spaced interpolation nodes
% xdata = cos(linspace(0,pi,n)); % Uncomment to try Chebyshev nodes

ydata = fx(xdata);              % interpolation funs
x = linspace(a, b, 200);        % x for plotting polynomials and function values 


% For your own testing, use
px = PolyEvalLagrange(x, xdata, ydata);  

sx = SplineCubic(xdata, ydata, x);

figure;

axis([-1,1,-1,1]); 

hold on;

% function in blue
plot(xdata, ydata, '-b', 'DisplayName', 'fx');

% lagrane in red
plot(x, px, '-r', 'DisplayName', 'px');

% spline in green
plot(x, sx, '-g', 'DisplayName', 'sx');

legend;

% Explaination:
% The primary thing that I noticed when increasing the n-value is that,
% the spline as the n values increase that it became more accurate.
% While the opposite was true for the lagrane especilly at the end points,
% of the function.
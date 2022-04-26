clear; % close all;

n = 15;             % polynomial degree 

% Example 1: sin function
%fx = @(x) sin(x*2*pi);   % interpolation function (You can try other funs)
%a = -1; b = 1;    % interpolation interval [a, b]

% Example 2: Runge function
fx = @(x) 1./(1 + 25*x.^2); 
a = -1; b = 1;

% ------------------------------
% 1. Define interpolating points
xdata = linspace(a,b,n+1)';     % equal spaced interpolation nodes
% xdata = cos(linspace(0,pi,n)); % Uncomment to try Chebyshev nodes

ydata = fx(xdata);              % interpolation funs
x = linspace(a, b, 200);        % x for plotting polynomials and function values 

% ------------------------------
% 2. Evaluate interpolation polynomial at each point of of x.
%    YOU CAN REPLACE THIS LINE WITH YOU OWN INTERPOLATION FUNCTIONS

% For your own testing, use
px = PolyEvalLagrange(x, xdata, ydata);   

% helper function
coeffNT = DividedDiff(xdata, ydata);

%px = PolyEvalNewton(x, coeffNT, xdata);    

% ------------------------------
% 3. plot results
figure
plot(xdata, ydata, 'or');   % sampled function value
hold on;
plot(x, fx(x), '--r');      % "exact" fun
plot(x, px, '-b');          % polynomials
title(['poly degree n=', num2str(n)])
legend('Interp points', 'f(x)', 'p_n(x)');

return
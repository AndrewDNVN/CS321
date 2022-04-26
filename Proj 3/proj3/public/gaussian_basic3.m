function I = gaussian_basic3(f, a, b)
% function gaussian_basic3 applies three points Gauss quadrature to approximate 
% the integral of f(x) over [a,b].

% change of interval
h = (b-a) / (2);

% ---------COMPLETE THE FOLLOWING LINES
x0 =	-(sqrt(3/5)) *h;                      
x1 =	0; 
x2 =	(sqrt(3/5))*h; 
A0 =	5/9;
A1 =	8/9;
A2 =	5/9;
% --

I = A0*f(x0) + A1*f(x1) + A2*f(x2);

% unsure of what is wanted here

return;


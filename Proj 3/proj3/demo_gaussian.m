% This is a demonstration routine for Gauss quadrature
format shorte;

fx = @(x) exp(-x).*cos(x); % testing function
a = 0; b = 2*pi; 	% inteval [a,b]
n = 0; check = 0;

% this was a quick way to check when the value came under what 
% was requested
while check < 1
n = n+1; 			% number of subintervals

Ie = (1-exp(-2*pi))/2;					% exact integral
Ig = gaussian_composite(fx, a, b, n); 	% by Gauss
Is = simpson_composite(fx, a, b, n);	% by Simpson
It = trap_composite(fx, a, b, n);		% by Trapezoid

%disp('error Gauss:')
check_G = abs(Ie - Ig);

%disp('error Simpson:')
check_S = abs(Ie - Is);

%disp('error Trap:')
check_T = abs(Ie - It);

if (check_S <= 1.0E-8)  
   fprintf('n is %d\n' , n);
   check = check + 1;
   break;
end

end

return
%--------------------
% Question: 
%
%	How many evaluations of f(x) are needed for each method to achieve
% 	absolute error bounded by 1.0E-8.
%
%--------------------
% ANSWER HERE: 
% Composite:    16      number of intervals needed
%               3 evals per call so 48 total

% Simpson:      204     number of intervals needed
%               3 evals per call so 612 total

% Trap:         18122   number of intervals needed
%               3 evals per call so 54366 total


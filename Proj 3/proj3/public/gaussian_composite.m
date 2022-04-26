function I = gaussian_composite(f, a, b, n)
% function gaussian_composite applies composite Gauss quadrature
% by subdividing the interval [a, b] into n subintervals and then apply
% the basic three-point Gaussian formula on each subinterval. 


% change of interval
h = (b-a) / (2 * n);

% define points to go over  
x = linspace(a, b, n +1);

% get weights from table
w1 = 5/9;
w2 = 8/9;

% get node values 
a1 = -sqrt(3/5)*h;
a2 = sqrt(3/5)*h;

% keep count for the total
total = 0;

% loop doing the calculation for the number of subintervals
% this uses the values from table 5.7
for i = 1:n
    
    % do the calculations
    total = total + w1 *feval(f, x(i) + h + a1);

    total = total + w2 *feval(f, x(i) + h);

    total = total + w1 *feval(f, x(i) + h + a2);

end

I = h * total;

return;
    
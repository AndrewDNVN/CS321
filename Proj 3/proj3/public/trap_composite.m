function I = trap_composite(f, a, b, n)
% function trap_composite applies composite trapzoidal for the integral of 
% f(x) on the interval [a,b], by dividing [a,b] into n subintervals.

% setup 
h=(b-a)/n;

sum_trap = 0;

store = zeros(n-1);

% run through the rows needed
for k = 1 : n-1
  
    % calc prep value
    store(k)=f(a+k*h);
    
    % calc row sum
    sum_trap = sum_trap + store(k);

end

% do calculation 
I = (h/2) * (f(a) + f(b) + (2*sum_trap));

return



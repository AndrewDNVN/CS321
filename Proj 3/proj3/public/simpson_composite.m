function I = simpson_composite(f, a, b, n)
% function simpson_composite applies composite simpson for the integral of 
% f(x) on the interval [a,b], by dividing [a,b] into n subintervals.

% do setup
h = (b-a)/n;

sum_odd = 0;
sum_even = 0;

store = zeros(n);

for k = 1 : n-1
    
    store(k)=f(a+k*h);
    
    % check for if even or odd
    % then calc sums 
    if rem(k,2) == 1
       sum_odd = sum_odd + store(k); %sum of odd terms
    else
       sum_even = sum_even + store(k); %sum of even terms
    end
end
    % formula for 1/3 simpsons
    I = (h/3)*(f(a) + f(b) + (4*sum_odd) + (2*sum_even));

return


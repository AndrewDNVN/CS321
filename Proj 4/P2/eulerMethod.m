
% simple implementation of eulers method

function [Y, T] = eulerMethod(h, a, b, x0, fx)

    n = (b-a)/h;

    Y = zeros(1, n);
    T = zeros(1, n);
   
    Y(1) = x0;
    T(1) = a; 

    for i = 1:n
    
        Y(i+1) = Y(i) + h*feval(fx, Y(i), T(i));
        T(i+1) = T(i) + h;

    end

end
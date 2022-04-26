
% implementation of the Runge-Kutta method

function [Y, x] = rungekuttaMethod(h, a, b, x0, fx);

    x = a:h:b;
    Y = zeros(1, length(x));

    Y(1) = x0;

    for i = 1:length(x)-1
    
        k1 = fx(    x(i), Y(i));
        
        k2 = fx(    (x(i) + h/2),   (Y(i)+ k1 * h / 2));
        
        k3 = fx(    (x(i) + h/2),   (Y(i)+ k2 * h / 2));
        
        k4 = fx(    (x(i) + h),     (Y(i) + k3 * h));

        Y(i+1) = Y(i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4) * h;
    
    end


end


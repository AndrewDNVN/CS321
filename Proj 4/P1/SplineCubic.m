function sx = SplineCubic(tdata, ydata, x)
    % Function sx = SplineCubic(tdata, ydata, x) evaluates the natrual cubic
    % spline interpolant S(x), corresponding to interpolation points {tdata, ydata},
    % at x. If the input x is a vector, then the output sx(i) = S( x(i) ).

    n = length(tdata);

    U = zeros(n, 1);
    V = zeros(n, 1);
    B = zeros(n, 1);
    H = zeros(n, 1);
    
    for i = 1:n-1 
    
       H(i) = tdata(i+1)-tdata(i);
       B(i) = (ydata(i+1)-ydata(i))/H(i);
    
    end
     
    U(1) = 2 *(H(1) + H(2));
    V(1) = 6 *(B(2) - B(1));
    
    for i = 2:1:n-1
    
        U(i) = (2 * (H(i) + H(i-1))) - ((H(i-1) * H(i-1)) / U(i-1));
        V(i) = (6 * (B(i) - B(i-1))) - ((H(i-1) * V(i-1)) / U(i-1));
    
    end

    Z = zeros(n, 1);
    
    Z(1) = 0;
    Z(n) = 0;

    for i = n-1:-1:1
    
       Z(i) = (V(i)-H(i)*Z(i+1)) / U(i);
    
    end

    sx = zeros(1, n);

    % start spline calc
    out = 0;

    for k = 1:length(x) 

        for i = 1:n-1
    
            if (x(k)-tdata(i)) >= 0

                tmp = (x(k)-tdata(i));

                C = (-(H(i)/6) * Z(i+1)) - ((H(i)/3) * Z(i)) + ((ydata(i+1)-ydata(i))/H(i));
        
                D = (Z(i)/2) + (1 / (6*H(i))) * tmp * (Z(i+1) - Z(i)); 

                hold = ydata(i);
        
                sx(k) = hold + tmp * (C + tmp * D);
            end

        end

    end


end


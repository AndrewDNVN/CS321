
% finding roots via the secant method

function out = root_secant(f, x0, x1, err_val)
    
    % used to break the loop as needed based
    % off of the provided error val / tolerance
    check = abs(x1-x0);

    while check > err_val
    
        % do secant method calculation
        x2 = x0 - f(x0)*((x1-x0)/(f(x1)-f(x0)));

        %swap values
        x0 = x1;        
        x1 = x2;

        % calc error value before relooping
        check = abs(x1-x0);

        out = x2;
    end

end



% function calculates the newton polyomial as requested

function px = PolyEvalNewton(x, coeffNT, xdata)
    
    % get length
    n = length(xdata);

    % set output
    px = zeros(length(x),1);

    for i = 1 : length(x)
        % set holds
        d(1) = 1;

        c(1) = coeffNT(1);
        
        for j = 2 : n
            
            % do upper calc
            d(j) = (x(i) - xdata(j-1)).*d(j-1);
            % mul in the coeffent
            c(j) = coeffNT(j) .* d(j);
        
        end
        % take in the sum in the c column
        % then loop
        px(i) = sum(c);

    end

end



% evaluates the polynomial in the lagrange form

function px = PolyEvalLagrange(x, xdata, ydata) 

    % get length
    n = length(xdata);
    % set output to zeros
    px = zeros(size(x));
    
    % Loop until end
    for i = 1:n
        % set weights to 1
        w = ones(size(x));
        
        % inner loop
        for j = 1 : n 
            % don't over write the same spots
            if(i~=j)
                % calc wieghts using array multiplication
                w = (x-xdata(j))./(xdata(i)-xdata(j)).*w;
            end
            
        end
        % multiply in y values with the current value in px
        px = px + w*ydata(i);
    end

end


% function used to calculate the divided diffrence table
% used in Newtons method

function CoeffNT = DividedDiff(xdata, ydata)
    
    % get length
    n = length(xdata);

    % set table
    table = zeros(n,n);

    % fill in initial column
    for i = 1:n
        table(i,1) = ydata(i);
    end
    % build table
    
    for i = 2:n
    % loop down column j from the diagonal
        for j = i:n
            table(j,i) = (table(j,i-1) - table(j-1,i-1)) / (xdata(j) - xdata(j-i+1));
        end

    end
    % take the diagonal values
    CoeffNT = diag(table);

end

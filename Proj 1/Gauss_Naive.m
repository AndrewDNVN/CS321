% Project 1 
% Andrew Donovan
% CS 321
% Part 1 and 2

% used https://www.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
% ^ I used this in building the below code

%% Note: in matlab the syntax is (row, column) to access a value

%n = 3;
%A = randn(n,n);
%b = randn(n);

%outP1 = Gauss_Naive(A, b)

function x = Gauss_Naive(A,b)
    
    % find size of b
    % this could be passed as a parameter
    % but project dictates that it is only A, b are 
    % passed
    n = length(b);
    
    % create the output matrix
    % creating a n by 1 output matrix to return the info
    x = zeros(n, 1);

    % now loop through and do the reduction

    % c is for column
    % r is for row
    % v is value: as in the value being worked on currently
    % A is input matrix
    % b is output vector
    % x is solution matrix

        % set to first column and work to the last column
            %% Matlab starting at 1 will never not cease to confuse me
        % this sets up the upper triangle matrix
        for c = 1 : n-1 
                
                % start working on the leading values in rows
                % +1 becuase the lead number in the column is 
                % unchanged
                for r = c + 1 : n
                    
                    % calc the correct reduction values
                    % for the rest of that row
                    % eg A(2, 1) / A(1,1) => ratio
                    % this ratio makes it so that the rest of the 
                    % row is is reduced by the leading value
                    ratio = A(r,c) / A(c,c);
                    
                    % do the calculation by going across the
                    % row until the end of the matrix
                    % this is done by calculating the value in the 
                    % column, and the current row (held in v) 
                    % times the ratio and subtractiong that 
                    % from the inital value held in (r, v)
                    % then storing that back into (r, v)
                    for v = c : n
                        
                        A(r, v) = A(r,v) - (A(c,v)*ratio);

                    % close of calc
                    end
                    
                    % correct b
                    % need to correc the b value
                    % no need to loop beucase this b is one dimension 
                    b(r) = b(r) - (b(c)*ratio);
                    
                % close of leading val row
                end 
        
        % close of column outer loop
        end

        % back sub 

        % Start from the bottom and go to the top
        for c = n:-1:1
            
            % store the current value in b(c)
            % into x(c), this is because
            % now that x(c) holds b(c)
            % when it is subtracted off by the 
            % multiplication performed below 
            % is subs back in the correctish 
            % (needs to be reduced by the ratio)
            % value
            x(c) = b(c);

            % go through the rows
            % and multiple the value (held in x(r)) by the
            % augmented matrix A(c, r).
            % subtract that from the value held in x(c)
            % store it there
            for r = c + 1 : n

                x(c) = x(c) - (A(c, r) * x(r));
                
            % close of calcs
            end

            % do final calc for corections
            % this is the reduction mentioned before
            x(c) = x(c)/A(c,c);

        % close of back sub
        end

end








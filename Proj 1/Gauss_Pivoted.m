% Project 1 
% Andrew Donovan
% CS 321
% Part 3 and 4

% used https://www.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
% ^ I used this in building the below code

% Most of the notes have been left off of this version except
% for the pivoting changes.
% please see Gauss_Naive.m for further explaintion of the 
% underlying principles.

%n = 3;
%A = randn(n,n);
%b = randn(n);

%outP2 = Gauss_Pivoted(A, b)

function x = Gauss_Pivoted(A, b)
    
    % find size of b
    n = length(b);
    
    % create the output matrix
    x = zeros(n, 1);


    % c is for column
    % r is for row
    % p is for pivot value
    % holdA is to hold the entire row of A
    % holdb is to hold the current value of b(c)
    % v is value: as in the value being worked on currently
    % A is input matrix
    % b is output vector
    % x is solution matrix

    % set to first column and work to the last column
    for c = 1 : n-1 

        % Pivoting section
        for p = c+1:n
            
            % check to see if switch is needed
            % this is done to set the pivot to have the largest
            % value on top of the diagonal to reduce
            % rounding errors.
           if abs(A(p,c)) > abs(A(c,c))
                % get the swap row and hold it for the A matrix
                % Expl: A(c,:) => for extracting the entire row of c
                % from the mathworks website above
                holdA = A(c,:);
                A(c,:) = A(p,:);
                A(p,:) = holdA;

                % swap b Matrix
                holdb = b(c);
                b(c) = b(p);
                b(p) = holdb;
            
            % close if   
            end

        % close pivot    
        end

        % Please see Gauss_Naive.m for further explaintion of the 
        % underlying principles.
                
        % start working on the leading values in rows
        for r = c + 1 : n
                    
            % calc the correct reduction values
            ratio = A(r,c) / A(c,c);
                    
                % do the calculation 
                for v = c : n
                        
                    A(r, v) = A(r,v) - (A(c,v)*ratio);

                % close of calc
                end
                
                % correct b
                b(r) = b(r) - (b(c)*ratio);
                    
        % close of leading val row
        end 
        
    % close of column outer loop
    end

    % Back sub
    % Start from the bottom
       for c = n:-1:1
           
           x(c) = b(c);

           % go through the rows
           for r = c + 1 : n

               x(c) = x(c) - (A(c, r) * x(r));
                
           % close of calcs
           end

           % do final calc
           x(c) = x(c)/A(c,c);

       % close of back sub
       end

end
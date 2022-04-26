function R = romberg(f, a, b, n)
% Function R = romberg(f, a, b, n) generates the Romberg array R of size
% (n+1) for a function f(x) over the interval [a,b]. The output R is a
% triagular matrix of size n+1.

R = zeros(n+1,n+1); % create R to store the Romberg array

% set the inital value
R(1, 1) = (b - a) * (f(a) + f(b)) / 2;

h = zeros(n);

% this way made more sense to me to do 
% by doing both actions at the same time as opposed to two diffrent loops

% loop through the row's
for i = 1 : n+1
   
    % calc hn value
    h(i) = (b-a) /2^(i) ;
    
    % reset sumdge value
    m = 0;

    % calc the summation for the trapezoidal rule
    for k = 1 : (2^(i))-1

        m = m + f(a+k*h(i));
    end

    % set the first column values as needed
    R(i + 1, 1) = (h(i) / 2) * (f(a) + f(b) + 2*m);

    % loop the columns 
    for j = 2 : i
        
        % this was done to help with readability
        % has no real impact on function
        prev = R(i, j-1);

        und = (4^(j-1) - 1);

        top = (R(i, j-1) - R(i - 1, j - 1));

        % do the calculation
        R(i, j) = prev + top / und;
    end
end

return

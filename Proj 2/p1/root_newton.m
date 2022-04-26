
% used to calculate via newtons method

function out = root_newton(f, x0, df, err_val)
   
    guess = 0;
    
    %sentinel used to break the loop
    sentinel = 2*err_val;

    while sentinel > err_val
        
        % do newtons method
        guess = x0-(f(x0)/df(x0));

        % determin error value
        sentinel = abs(guess-x0);

        x0 = guess;
    end

    out = guess;

end
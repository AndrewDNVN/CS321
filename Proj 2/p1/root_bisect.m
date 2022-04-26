
% calculate roots via the bisection method
 
function out = root_bisect(f, x0, x1, err)

    out = (x0+x1)/2;

    while (abs(f(out)) > err) 

        if f(out)<0 && f(x0)<0
            x0 = out;
        else
            x1 = out;
        end
       
        out = (x0+x1)/2; 
     
    end

end
format long
%% in order from least to greates power
poly = [1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];
in = 3.28;  

out = horner_321(poly, in);

%% used to dump to terminal
out

function x = horner_321(poly, in)
%% run the length of the vector
n = length(poly);
%% set the inner value as the intial result
result = poly(1);
    %% now loop through the vector working outward
    %% to the smaller powers
    %% matlab is weird it starts @ 1 and not zero
    for i = 2:n
        result = result*in + poly(i);
    end

x = result;
end

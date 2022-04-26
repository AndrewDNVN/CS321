% This is a demoe^xnstration routine for Romberg method
format shorte;

% Three testing functions
f1 = @(x) 1./(1+x);
I1 = log(2); % exact integral from [0,1];

f2 = @(x) exp(x);
I2 = exp(1) - 1; % exact integral from [0,1];

f3 = @(x) 4./(1+x.^2);
I3 = pi; % exact integral from [0,1];


% Run Romberg and display absolute error for the bottom row
n = 4; 
disp('Error for bottom row:')

disp('Fun f1');
R1 = romberg(f1, 0, 1, n);
E1 = abs( R1(n+1,:) - I1 );
disp(E1)

disp('Fun f2');
R2 = romberg(f2, 0, 1, n);
E2 = abs( R2(n+1,:) - I2);
disp(E2)

disp('Fun f3');
R3 = romberg(f3, 0, 1, n);
E3 = abs( R3(n+1,:) - I3);
disp(E3)

return

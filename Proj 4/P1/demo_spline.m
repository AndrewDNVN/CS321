close all; clc; clear;

figure;
axis([-1,1,-1,1]); hold on;
title('left click to select, right click to draw, hit 0 to return')

% Each while loop generates one curve.
while(1) 
    % Part I: Select interpolation points on the x-y plane, 
    % collected in the vector X and Y.
    X = []; Y = [];
    while(1)
        [x, y, flag] = ginput(1); % help ginput 
        if flag == 48       % key "0" hit detected
            return;
        elseif flag ~= 1    % right click detected
            break
        end
        X = [X,x];
        Y = [Y,y];   % save the clicked point in to X and Y
        plot(x,y, '.k');        % display the clicked point
        axis([-1,1,-1,1]);
    end

    % Part II: generate plane curve that goes through the selected points 

    N = length(X);              % number of points
    t = linspace(0,1,N);        % parameter t
    tp = linspace(0,1, 1000);   % parameter for plotting

    xp = spline(t,X,tp);    % find spline for x
    yp = spline(t,Y,tp);    % find spline for y

    plot(xp, yp, '-b', 'DisplayName', 'spline');     % plot the spline

    xc = SplineCubic(t, X, tp);
    yc = SplineCubic(t, Y, tp);

    % not the greate
    diffx = abs(sum(xp,'all') - sum(xc,'all'));
    diffy = abs(sum(yp,'all') - sum(yc,'all'));
    fprintf("diffx %d, diffy %d\n", diffx, diffy);

    plot(xc, yc, '-r', 'DisplayName', 'amdo257 spline');

    legend;

  
end





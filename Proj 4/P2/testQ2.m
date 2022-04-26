close all; clear; clc;


% parameters

h1 = .1;
h2 = .05;
h3 = .001;

a = -5; b = 5;

% setup IVP1
gx = @(t) 1+(.5)*exp(-4*t)-(.5)*exp(-2*t);

fx = @(x, t) 2 - (2*x) - exp(-4*t);

% x(0) = 1
ivp1 = 1;

% Start of second IVP

hx = @(t) exp(t/2).*sin(5*t);

bx = @(x, t) x + 5*exp(t/2).*cos(5*t)-(.5)*exp(t/2).*sin(5*t);

% x(0) = 0
ivp2 = 0;


%% ============= Runge-Kutta order 4=

    %% ==========IVP1=========
%rungekuttaMethod(fx, xa, a, h);
[TR1, R1] = rungekuttaMethod(fx, ivp1, a, b, h1);
[E1, TE1] = eulerMethod(h1, 0, b, ivp1, fx);
x1 = a:h1:b;

gout1 = gx(x1);

figure;
%subplot(3,2, 1);
hold; axis([0,5,0,1.05]); title('IVP1 with h = .1'); hold on;
plot(x1, gout1, 'bl', 'DisplayName', 'gx');
plot(TR1, R1, 'o', 'DisplayName', 'rungekutta');
plot(TE1, E1, '*', 'DisplayName', 'euler');
legend; hold off;


% [Y2, T2] = rungekuttaMethod(h2, 0, b, ivp1, fx);
% 
% x2 = a:h2:b;
% 
% gout2 = gx(x2);
% 
% subplot(3,2, 3);
% axis([0,5,0,1.05]); title('h = .1');title('IVP1 with h = .05');hold on;
% plot(x2, gout2, 'bl', 'DisplayName', 'gx');
% plot(T2, Y2, 'o', 'DisplayName', 'rungekutta');
% legend; hold off;
% 
% [Y3, T3] = rungekuttaMethod(h3, 0, b, ivp1, fx);
% 
% x3 = a:h3:b;
% 
% gout3 = gx(x3);
% 
% subplot(3,2, 5);
% axis([0,5,0,1.05]); title('h = .1');title('IVP1 with h = .001'); hold on;
% plot(x3, gout3, 'bl', 'DisplayName', 'gx');
% plot(T3, Y3, 'o', 'DisplayName', 'rungekutta');
% legend; hold off;
% 
% 
%     %% ==========IVP2=========
%     
% 
% [Y4, T4] = rungekuttaMethod(h1, a, b, ivp2, bx);
% 
% x4 = a:h1:b;
% 
% hout1 = hx(x4);
% 
% subplot(3,2, 2);
% hold; axis([0,5,-15, 25]); title('IVP1 with h = .1'); hold on;
% plot(x4, hout1, 'bl', 'DisplayName', 'hx');
% plot(T4, Y4, 'o', 'DisplayName', 'rungekutta');
% legend; hold off;
% 
% [Y5, T5] = rungekuttaMethod(h2, a, b, ivp2, bx);
% 
% x5 = a:h2:b;
% 
% hout2 = hx(x5);
% 
% subplot(3,2, 4);
% hold; axis([0,5,-15, 25]); title('IVP2 with h = .05'); hold on;
% plot(x5, hout2, 'bl', 'DisplayName', 'hx');
% plot(T5, Y5, 'o', 'DisplayName', 'rungekutta');
% legend; hold off;
% 
% [Y6, T6] = rungekuttaMethod(h3, a, b, ivp2, bx);
% 
% x6 = a:h3:b;
% 
% hout3 = hx(x6);
% 
% subplot(3,2, 6);
% hold; axis([0,5,-15, 25]); title('IVP2 with h = .001'); hold on;
% plot(x6, hout3, 'bl', 'DisplayName', 'hx');
% plot(T6, Y6, 'o', 'DisplayName', 'rungekutta');
% legend; hold off;
% 

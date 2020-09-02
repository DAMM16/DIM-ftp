clear all; close all; clc;
%% Implementacion particular del metodo de Newton-Raphson
f=@(x) x.^2.*cos(x.^2+1)                        %
df=@(x) 2*x.*cos(x.^2+1)-2*x.^3.*sin(x.^2+1);   %
x=0:0.01:pi; plot(x,f(x),'-r'); grid on; hold all; %
x0=2.35;
for it=1:5                                 %
   plot(x0,f(x0),'*b');                         %
   plot(x,df(x0)*(x-x0)+f(x0),'-k')             % 
   pause(1)                                     %
   x0=x0-f(x0)/df(x0);                          %
end
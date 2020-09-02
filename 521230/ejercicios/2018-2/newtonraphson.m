clear all; close all; clc;
%% Implementacion particular del metodo de Newton-Raphson
f=@(x) x.^2.*cos(x.^2+1)                        %
df=@(x) 2*x.*cos(x.^2+1)-2*x.^3.*sin(x.^2+1);   %
x=-1.6:0.01:1.6; plot(x,f(x),'-r'); grid on; hold all; % %
x0=1.5;
epsilon = 10^(-8);% Tolerancia 
max_it = 1000; % Numero maximo de iteraciones
xk = [];
for it = 1 : max_it                             
   plot(x0,f(x0),'*b');                         
   plot(x,df(x0)*(x-x0)+f(x0),'-k')              
   pause(1)                                     
   x1=x0-f(x0)/df(x0)
   if abs(x1-x0) < epsilon
     break
   else
     x0 = x1;
   end
   xk = [xk;x0]
end
clear all; close all; clc;
f1=inline('cos(x)+2*x'); 
f2=inline('x.^2');
ezplot(f1); hold all; ezplot(f2);

%% Implementacion del metodo de Newton
f=inline('[cos(x)-y+2*x;y-x.^2]','x','y');
Df=inline('[-sin(x)+2,-1;-2*x,1]','x','y');
x0=[4;15];
for it=1:15
   plot(x0(1),x0(2),'*');
   x0=x0-inv(Df(x0(1),x0(2)))*f(x0(1),x0(2)); 
   pause(1);
end
clear all; close all; clc;
t=[10 20 30 40 50 60 70 80];
y=[1.06 1.33 1.52 1.68 1.81 1.91 2.01 2.11];
p=polyfit(t,log(y),1); % En Matlab el logaritmo natural es log
fprintf('parametro x_2 = %2.3f\n',p(1));
fprintf('parametro x_1 = %3.3f\n',exp(p(2)));
hold on
plot(t,y,'ro')
x=linspace(min(t),max(t),50);
z=exp(p(2))*exp(p(1)*x);
plot(x,z,'b')
xlabel('x')
ylabel('y')
title('Regresion exponencial')
hold off
clear all; close all; clc;
%% Implementación particular del método de la bisección
f=inline('cos(x.^2+1)./(x+1)','x'); % Resuma lo que se hacen en estas líneas
ezplot(f); grid on; hold all;       %
xa=1; xb=6;                         %                                       
while abs(xa-xb)>=10^(-4)           %
    plot([xa,xb],f([xa,xb]),'*k');  %
    xr=(xa+xb)/2;                   %
    plot(xr,f(xr),'*r');            %    
    pause(1);                       %
    if f(xa)*f(xr)<0                %
        xb=xr;                      %
    else
        xa=xr;                      %
    end
end
error=abs(f(xr)-0)                  %
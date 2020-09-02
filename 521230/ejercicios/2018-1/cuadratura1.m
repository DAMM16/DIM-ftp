%% Animación de una cuadratura compuesta
close all; clear all; clc;  
f=inline('cos(x)./(abs(x)+1)');
ezplot(f,[-10,10,-0.5,1.2]); hold all; grid on;
x=-10:1:10;
puntosMedios=(x(2:end)+x(1:end-1))/2;
plot(puntosMedios,f(puntosMedios),'.b');
areas=cumsum((x(2:end)-x(1:end-1)).*f(puntosMedios));
for k=1:length(x)-1
    plot(x([k,k,k+1,k+1,k]), [0,f(puntosMedios(k)),f(puntosMedios(k)),0,0],'-r');
    t=text(10,1,num2str(areas(k)));
    pause(0.25);
    delete(t);
end


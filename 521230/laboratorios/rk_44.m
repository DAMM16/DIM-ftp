function [x,y]=rk_44(x0,y0,h,xf)
%y0 es un vector columna
n=(xf-x0)/h;
x(1)=x0;
y(:,1)=y0;
for i=1:n
    x(i+1)=x(i)+h;
    k1=frk(x(i),y(:,i));
    k2=frk(x(i)+h/2,y(:,i)+h*k1/2);
    k3=frk(x(i)+h/2,y(:,i)+h*k2/2);
    k4=frk(x(i+1),y(:,i)+h*k3);
    y(:,i+1)=y(:,i)+h/6*(k1+2*(k2+k3)+k4);
end
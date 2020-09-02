function [x,y]=rk_22(x0,y0,h,xf)
%y0 es un vector columna
theta=.5;
n=(xf-x0)/h;
x(1)=x0;
y(:,1)=y0;
for i=1:n
    k1=frk(x(i),y(:,i));
    x(i+1)=x(i)+h;
    y(:,i+1)=y(:,i)+h*(1-1/(2*theta))*k1+h/(2*theta)*frk(x(i)+h/2,y(:,i)+h*theta*k1);
end
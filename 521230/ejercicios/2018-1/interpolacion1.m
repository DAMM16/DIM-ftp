%% Rutero de ejemplo de interpolacion polinomial
x=[-4:1:4];
n=9;
y=sin(x); 
plot(x,y,'*r') 
hold on 
for i=1:n 
for j=1:n 
A(i,j)=x(i)^(n-j);  
end 
end 
c = A\y' 
t=[-6:0.01:6]; 
px=c(1); 
for k=2:n; 
px = px .* t + c(k); 
end 
plot(t,px)
plot(t,sin(t),'r')
legend('Puntos','Polinomio inter.','Funcion interp.');

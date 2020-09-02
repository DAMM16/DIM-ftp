nn=[100:100:1000];
t1=[];
t2=[];
for n=nn
   A=rand(n);
   y=ones(n,1);

   t0=cputime;
   x=inv(A)*y;
   t1=[t1 cputime-t0];

   t0=cputime;
   x=A\y;
   t2=[t2 cputime-t0];
end
plot(nn,t1,'*-',nn,t2,'d-')

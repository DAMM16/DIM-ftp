function raiz=newton(f,Df,x0,tol,maxit)

k=0;
raiz=x0;
corr=tol+1;
while (k<=maxit) & (abs(corr)>tol)
    k=k+1;
    xk=raiz;
    fxk=feval(f,xk);
    Dfxk=feval(Df,xk);
    if (Dfxk==0)
	error('La derivada de la funcion se anula.')
    end
    corr=fxk/Dfxk;
    raiz=xk-corr;
end

if (abs(corr)>tol)
    error('Se excedio el numero maximo de iteraciones.')
end

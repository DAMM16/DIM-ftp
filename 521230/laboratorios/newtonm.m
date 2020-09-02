function [raiz,k]=newtonm(f,Df,x0,p,tol,maxit)

k=0;
raiz=x0;
corr=tol+1;
while (k<maxit) & (abs(corr)>tol)
    k=k+1;
    xk=raiz;
    fxk=feval(f,xk);
    Dfxk=feval(Df,xk);
    if (abs(fxk)<eps)&(Dfxk==0)
        corr=0;
    else
        if (Dfxk==0)
            error('La derivada de la funcion se anula.')
        end
        corr=fxk/Dfxk;
        raiz=xk-p*corr;
    end
end
if (abs(corr)>tol)
    error('Se excedio el numero maximo de iteraciones.')
end

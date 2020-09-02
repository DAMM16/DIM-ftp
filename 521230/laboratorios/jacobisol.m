function [soljac,tolalcanzada,iteraciones] = jacobisol(A,b,x0,tol,maxiter)
% se resuelve sistema Ax = b con metodo de Jacobi
% los primeros dos parametros de entrada son matriz A y parte derecha b
% la solucion se almacena en soljac
% los restantes parametros son:
% x0: aproximacion inicial, tol: tolerancia y 
% maxit: maximo numero de iteraciones. 
% en soljac se guarda la aproximacion a la solucion exacta del sistema a
% resolver
% tolalcanzada indica si se alcanzo la 
% precision deseada en la solucion numerica
% iteraciones indicara el numero de iteraciones necesarias para obtener la
% precision deseada (si tolalcanzada es 1) o sera igual al numero maximo
% de iteraciones (si tolalcanzada es 0)

[m,n] = size(A);


% descomposicion de A
D = diag(diag(A));
E = -(tril(A)-D);
F = -(triu(A)-D);
% matriz de iteracion del metodo de Jacobi, no es necesario calcularla para
% implementar el metodo, pero queremos comprobar si su radio espectral es
% estrictamente menor que 1. Esta es una condicion necesaria y suficiente
% para la convergencia del metodo
MJAC = inv(D)*(E+F);
% valores propios de MJAC
abs(eig(MJAC))

% necesario para implementar criterio de parada en laminas del curso
x00 = zeros(length(x0),1);
% inicializando numero de iteracion actual
it = 1;
% inicializando variable que chequea si se alcanzo la tolerancia 
% requerida en la solucion aproximada
conv = 0;    
while ~conv && it <= maxiter
    % inicializar vector donde se almacena iterando a calcular en paso
    % actual
    xnew = zeros(n,1);
    % ciclo del metodo de Jacobi
    for j = 1 : n
        suma = 0;
        for k = 1 : j-1
            suma = suma + A(j,k)*x0(k);
        end
        for k = j+1 : n
            suma = suma + A(j,k)*x0(k);
        end
        xnew(j) = (b(j)-suma)/A(j,j);
    end
    % se ha calculado el iterando actual, se comprueba si se alcanzo la
    % tolerancia requerida, para ello debe comprobarse si
    % coef*norm(diferencia entre iterando actual e iterando anterior)
    % es menor o igual que la tolerancia requerida, coef se especifica
    % en las transparencias del curso
    if it >= 2
        nM = norm(xnew-x0)/norm(x0-x00);
        coef = nM/(1-nM);
        if coef <= 0
            coef = 1;
        end
    else
        coef = 1;
    end
    conv = (coef*norm(xnew-x0) <= tol);
    x00 = x0;
    x0 = xnew;
    % aumentando numero de iteraciones
    it = it + 1;
end
soljac = xnew;
tolalcanzada = conv;
iteraciones = it-1;
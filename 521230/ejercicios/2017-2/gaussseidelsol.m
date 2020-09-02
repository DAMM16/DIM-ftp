function [soljac,convergencia,iteraciones] = gaussseidelsol(A,b,x0,tol,maxiter)
% se resuelve sistema Ax = b con metodo de Gauss-Seidel
% los primeros dos parametros de entrada son matriz A y parte derecha b
% la solucion se almacena en soljac
% los restantes parametros son:
% x0: aproximacion inicial, tol: tolerancia y 
% maxit: maximo numero de iteraciones. 
% en soljac se guarda la aproximacion a la solucion exacta del sistema a
% resolver
% convergencia indica si se alcanzo la precision deseada en 
% la solucion numerica (1 indica que si se alcanzo, 0 indica que no)
% iteraciones indicara el numero de iteraciones necesarias para obtener la
% precision deseada (si convergencia es 1) o sera igual al numero maximo
% de iteraciones (si convergencia es 0)

[m,n] = size(A);

% necesario para implementar criterio de parada en laminas del curso
x00 = zeros(length(x0),1);
% inicializando numero de iteracion actual
it = 1;
% inicializando variable que chequea si se alcanzo la tolerancia 
% requerida en la solucion aproximada
conv = 0;
F = -triu(A,1);
E = -tril(A,-1);
D = diag(diag(A));
P = F;
N = D - E;
while ~conv && it <= maxiter
    xnew = [];
    xnew=N\(P*x0+b);
    % se ha calculado el iterando actual, se comprueba si se alcanzo la
    % tolerancia requerida, para ello debe comprobarse si
    % coef*norm(diferencia entre iterando actual e iterando anterior)
    % es menor o igual que la tolerancia requerida, coef se especifica
    % en las transparencias del curso 
    if it >= 2
        % aproximando norma de matriz de iteracion
        nM = norm(xnew-x0,inf)/norm(x0-x00,inf);
        coef = nM/(1-nM);
        if coef <= 0
            coef = 1;
        end
    else
        coef = 1;
    end
    conv = (coef*norm(xnew-x0,inf) <= tol);
    x00 = x0;
    x0 = xnew;
    % aumentando numero de iteraciones
    it = it + 1;
end
soljac = xnew;
convergencia = conv;
iteraciones = it-1;
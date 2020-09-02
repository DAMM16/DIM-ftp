function IT = invtrid(n,a,b,c)
% calcula inversa de matriz tridiagonal con elementos
% sobre diagonal principal iguales a a
% y elementos sobre diagonales secundarias iguales a b y c
% con el algoritmo de Thomas se encuentra la descomposicion LU
% de A y luego se resuelven los sistemas Ux = y, Ly = b
% con b igual a los vectores canonicos

% Laboratorio 4, calculo numerico (521230), S2-2011
IT = zeros(n);
for i = 1:n
    % resolviendo sistema con i-esimo vector canonico en parte derecha
    % primero se crean las matrices L y U
    % L y U son matrices tridiagonales, los elementos debajo de la diagonal
    % principal de L se almacenan en alpha
    % Los elementos sobre diagonal principal de U se guardan en beta y los
    % elementos encima de diagonal principal en gamma
    alpha = zeros(n,1);
    beta = zeros(n,1);
    beta(1) = a;
    gamma = b*ones(n-1,1);
    for k = 2 : n
        alpha(k) = c/beta(k-1);
        beta(k) = a-(c/beta(k-1))*b;
    end
    % una vez creadas L y U, se resuelve sistema Ly = ei
    y = zeros(n,1);
    ev = zeros(n,1);
    ev(i) = 1;
    y(1) = ev(1);
    for k = 2:n
        y(k) = ev(k) - alpha(k)*y(k-1);
    end
    % Ahora se resuelve sistema Ux = y y la solucion se guarda en i-esima
    % columna de inversa de matriz tridiagonal
    IT(n,i) = y(n)/beta(n);
    for j = n-1:-1:1
         IT(j,i) = (y(j)-gamma(j)*IT(j+1,i))/beta(j);
    end
end
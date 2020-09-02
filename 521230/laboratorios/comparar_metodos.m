function [] = comparar_metodos(nombrearchivo,tol,maxit)
% funcion para comparar la descomposicion de Cholesky y los metodos del gradiente
% conjugado y el gradiente conjugado precondicionado aplicados a la
% solucion de un sistema de ecuaciones lineales con matriz
% simetrica, definida positiva, sparse y de dimension grande.

% Entrada: nombrearchivo puede ser data-1.mat, data-2.mat o data-3.mat.
% tol y maxit se usan para llamar a los metodos iterativos.

% cargando datos desde el archivo data-1, data-2 o data-3.mat
data = load(nombrearchivo);
% Los datos almacenados son: A, b matriz y parte derecha del sistema de
% ecuaciones a resolver para determinar desviacion de membrana
A = data.A;

% A es sparse, el comando para estimar su numero de condicion es condest
disp('condicion de A')
condest(A)

b = data.b;
% Los datos siguientes son necesarios para mostrar la desviacion de la
% membrana, comprenderlos no es parte de este laboratorio
FreeNodes = data.FreeNodes;
Elements = data.Elements3;
Coordinates = data.Coordinates;

figure(1);
spy(A);
title('Estructura de matriz A');

disp('cantidad de elementos distintos de cero en A')
nnz(A)

% resolviendo sistema de ecuaciones con descomposicion de Cholesky
% inicializar cronometro para medir tiempo necesario para resolver sistema
% mediante descomposicion de Cholesky
tic;
% calcular matriz de descomposicion de Cholesky 
R = chol(A);
% resolver sistemas triangulares
solchol = R\(R'\b);
tiempochol = toc;
disp('tiempo solucion Cholesky')
tiempochol
% desventaja de descomposicion de cholesky para resolver sistemas de
% ecuaciones lineales con matrices sparse: R no tiene tantos elementos 
% iguales a cero como A
% hagamos spy de R
figure(2)
spy(R)
title('Estructura de matriz R');
% residuo con solchol
disp('norma 2 de residuo en solucion por Cholesky')
norm(b - A*solchol)/norm(b)
% para encontrar solchol se almacenan A, b, R, solchol
% A y R se almacenan como sparse, por eso solo contamos la cantidad de
% elementos distintos de cero en ellas
disp('almacenamiento Cholesky')
nnz(A) + nnz(R) + length(b) + length(solchol) 

% resolviendo con metodos iterativos
% Gradiente conjugado
% inicializando cronometro para medir tiempo necesario para resolver
% sistema de ecuaciones lineales con metodo de gradiente conjugado
tic;
% llamando a gradiente conjugado sin precondicionador
% si flaggc es cero a la salida, el metodo pudo calcular solucion
% aproximada con precision requerida 
% itgc es el numero de iteraciones realizadas por el metodo
[solgc,flaggc,relrgc,itgc] = pcg(A,b,tol,maxit);
tiempogc = toc;
disp('tiempo gradiente conjugado')
tiempogc
if flaggc ~= 0
    disp('gradiente conjugado no alcanzo tolerancia requerida')
end
if flaggc == 0
    figure(4)
    % mostrar deformacion de membrana mediante llamado a mostrarmembrana
    % el 1er parametro de entrada es solucion a sistema de ecuaciones,
    % contiene la deformacion de la membrana despues de aplicar una fuerza
    % a ella
    % Coordinates, FreeNodes y Elements son los restantes elementos
    % almacenados en data-1, data-2 o data-3.mat y que son utiles para
    % mostrar solucion
    % el ultimo parametro de entrada es un titulo para el grafico de la
    % deformacion de la membrana
    mostrarmembrana(solgc,Coordinates,FreeNodes,Elements,'Membrana, GC');
    % residuo con gradiente conjugado
    disp('norma 2 de residuo en solucion gradiente conjugado')
    relrgc
end
disp('almacenamiento GC')
% calcular cuantos numeros reales es necesario almacenar en memoria para
% obtener xgc


% Gradiente conjugado precondicionado
% inicializar cronometro antes de calcular precondicionador
tic;
% calcular precondicionador con cholinc y droptol = 1e-2

% mostrar estructura de precondicionador (usar spy)

% calcular solucion con gradiente conjugado precondicionado llamando a pcg

% mostrar tiempo para calcular calcular solucion por gradiente conjugado
% precondicionado (incluyendo tiempo para calcular precondicionador)
tiempogcp = toc;
disp('tiempo gradiente conjugado precondicionado')
tiempogcp

% si se ha alcanzado la tolerancia requerida, mostrar deformacion de
% membrana y norma del residuo relativo

% calcular cuantos numeros reales es necesario almacenar en memoria para
% obtener solucion por gradiente conjugado precondicionado

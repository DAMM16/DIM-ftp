function I = trap(func,a,b,n,varargin)
% TRAP: regla del trapecio
%
%   I = trap(func,a,b,n,p1,p2,...)
%
% implementa la regla del trapecio compuesta
%
% Entradas:
% func = nombre de la función a ser integrada
% a, b = limites de integración
% n = número de nodos (por defecto = 100)
% p1,p2,... = parametros adicionales de la función func
%
% Salida:
% I = estimación de la integral
% 
% Ejemplo:
%         f=@(x) x.^2; trap(f,-1,1,55)
% 
%         ans =
% 
%             0.6671
if nargin<3,error('por lo menos tres parámetros de entrada son requeridos');end
if ~(b>a),error('el límite superior debe ser mayor que el inferior');end
if nargin<4 || isempty(n),n=100;end
nodos=linspace(a,b,n);
evals=func(nodos,varargin{:});
I=(b-a)/(n-1)*sum([evals(1)/2,evals(2:end-1),evals(end)/2]);
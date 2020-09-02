function [] = mostrarmembrana(x,Coordinates,FreeNodes,Elements,titulo)
% funcion para mostrar solucion a Ax=b
% con matrices A y b que resultan de resolver la EDPs que modelan una
% membrana con el metodo de elementos finitos

% Coordinates contiene las coordenadas de los nodos de la malla espacial
% Elements3 y Elements4 contiene 

u(FreeNodes)=x;
hold off
trisurf(Elements,Coordinates(:,1),Coordinates(:,2),u');
view(-67.5,30);
title(titulo)
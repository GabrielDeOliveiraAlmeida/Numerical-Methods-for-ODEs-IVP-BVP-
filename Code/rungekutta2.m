%{
  @description Rungekutta de 2 ordem, método de euler melhorado, método de euler
  modificado
%}
function [y,x] = rungekutta2(funcao, alfa, intervaloInicial, intervaloFinal, h)
%Espacamento, Tamanho de passos;    
[n,h] = espacamento(h, intervaloInicial, intervaloFinal);
%Declaracao vetores
y = NaN(1,n);
y(1) = alfa;

x = intervaloInicial:h:intervaloFinal;
%% Runge Kutta de Ordem 2;
for i=1:1:n-1
    %Ponto Medio - Método de euler modificado c1 = 0, c2 =1 e a2 = 1/2.
    k1 = funcao(x(i), y(i));
    k2 = funcao(x(i)+h/2, y(i)+k1*h/2);
    y(i+1) = y(i) + k2*h;
    %Para Euler Melhorado. c1 = c2 = 1/2 e a2= 1
%     k1 = funcao(x(i), y(i));             
%     k2 = funcao(x(i)+h , y(i)+h*k1);
%     y(i+1) = y(i) + (h/2)*(k1+k2); 
%     %Método de Ralston c2 = 2/3, c1 = 1/3, a1=a2=3/4
%     k1 = funcao(x(i), y(i));
%     k2 = funcao(x(i) + 3*h/4, y(i) + 3*k1/4);
%     y(i+1) = y(i) + (k1/3 + 2*k2/3)*h;
end
end

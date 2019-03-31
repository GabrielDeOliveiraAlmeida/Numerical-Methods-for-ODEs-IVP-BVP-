%{
  @description Encontrar os valores do problema de valor inicial, utilizando o
  método de euler avançada ( progressiva)
  @return {[solucao, malha]}
%}
function [y,x] = eulerProgressivo(funcao, valorInicial, intervaloInicial, intervaloFinal, h)
  %Espacamento, Tamanho de passos;    
  [n,h] = espacamento(h, intervaloInicial, intervaloFinal);
  
  %Declaracao dos vetores (x,y);
  x = intervaloInicial:h:intervaloFinal;
  y = NaN(1,n);
  
  %PVI
  y(1) = valorInicial;  
  
  for i=1:1:n-1
    y(i+1) = y(i) + h * (funcao(x(i), y(i)));
  end
  
  end
  

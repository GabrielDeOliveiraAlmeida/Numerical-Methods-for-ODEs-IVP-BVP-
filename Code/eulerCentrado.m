%{
  @description Encontrar os valores do problema de valor inicial utilizando o método de
    euler atrasada ( regressiva)
  @return {[solucao, malha]}
%}
function [y,x] = eulerCentrado(funcao, valorInicial, intervaloInicial, intervaloFinal, h)
   %Espacamento, Tamanho de passos;    
  [n,h] = espacamento(h, intervaloInicial, intervaloFinal);
  %Declaracao dos vetores (x,y);
  x = intervaloInicial:h:intervaloFinal;
  y = NaN(1,n);
  %PVI
  y(1) = valorInicial;  
  y(2) =  y(1) + h * (funcao(x(1), y(1)));
  for i=2:1:n-1
        y(i+1) = y(i-1) + 2*h*(funcao(x(i), y(i)));
  end
end

%{
  @description Encontrar os valores do problema de valor inicial utilizando o método de
    euler atrasada ( regressiva)
  @return {[solucao, malha]}
%}
function [y,x] = eulerRegressivo(funcao, valorInicial, intervaloInicial, intervaloFinal, h)
   %Espacamento, Tamanho de passos;    
  [n,h] = espacamento(h, intervaloInicial, intervaloFinal);
  %Declaracao dos vetores (x,y);
  x = intervaloInicial:h:intervaloFinal;
  y = NaN(1,n);
  %PVI
  y(1) = valorInicial;  
  cd EquacaoNaoLinear;
  for i=1:1:n-1
        %y(i+1) = bisseccao(funcao, intervaloInicial, intervaloFinal, espacamento, y(i), x(i));          
        y(i+1) = newton(funcao, x(i+1), y(i), h);     
  end
  cd ..
end

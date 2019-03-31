%{
    @description Inverter os valores da qtd de pontos (N) com o espaçamento
    (h), caso seja menor que 1,
    Exercicios as vezes dão espacamento, as vezes a qtd de pontos...
%}
function [n,h] = espacamento(h, intervaloInicial,intervaloFinal)
 if h<=1
    n = (intervaloFinal - intervaloInicial)/h; 
    n = n+1;
 else
    n = h;
    h = (intervaloFinal - intervaloInicial)/n; 
    h = h + 1;
 end
end
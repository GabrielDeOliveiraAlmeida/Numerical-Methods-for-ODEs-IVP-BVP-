%{
  Rungekutta de 3 ordem, conhecido como método de Heun.
%}
function [y,x] = rungekutta3(funcao, alfa, intervaloInicial, intervaloFinal, h)
%Espacamento, Tamanho de passos;    
[n,h] = espacamento(h, intervaloInicial, intervaloFinal);
%Declaracao vetores
y = NaN(1,n);
y(1) = alfa;

x = intervaloInicial:h:intervaloFinal;
%% Runge Kutta de Ordem 2;
for i=1:1:n-1
    k1 = funcao(x(i), y(i));             
    k2 = funcao(x(i)+h/3, y(i) + h*k1/3);
    k3 = funcao(x(i)+(2*h)/3, y(i)+(2*h*k2)/3);
    y(i+1) = y(i) + h/4*(k1 + 3*k3);
end

end
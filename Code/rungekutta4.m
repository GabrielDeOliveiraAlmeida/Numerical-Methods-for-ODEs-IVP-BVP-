%{
  @description  Rungekutta de 4 ordem
%}
function [y,x] = rungekutta4(funcao, alfa, intervaloInicial, intervaloFinal, h)
  %Espacamento, Tamanho de passos;    
  [n,h] = espacamento(h, intervaloInicial, intervaloFinal);
%Declaracao vetores
y = NaN(1,n);
y(1) = alfa;

x= intervaloInicial:h:intervaloFinal;
%% Runge Kutta de Ordem 4;
for i=1:1:n-1
    k1=funcao(x(i), y(i));
    k2=funcao(x(i)+h/2, y(i)+h/2*k1 );
    k3=funcao(x(i)+h/2, y(i)+h/2*k2);
    k4=funcao(x(i)+h, y(i)+h*k3);
    y(i+1) = y(i) + (h/6)*(k1+2*k2+2*k3+k4);
end

end

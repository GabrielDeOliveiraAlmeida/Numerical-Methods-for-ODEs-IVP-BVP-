%{
  @description Método previsor-corretor
%}

function [y,x] = previsorcorretor(f, alfa, intervaloInicial, intervaloFinal, h)
%Espacamento, Tamanho de passos;    
[n,h] = espacamento(h, intervaloInicial, intervaloFinal);
%Declaracao vetores
   y = NaN(1,n);
   y(1) = alfa;
   x = intervaloInicial:h:intervaloFinal;

    %Primeiro valores
    for i= 1:1:3   
        k1=f(x(i), y(i));
        k2=f(x(i)+h/2, y(i)+h/2*k1 );
        k3=f(x(i)+h/2, y(i)+h/2*k2);
        k4=f(x(i)+h, y(i)+h*k3);
        y(i+1) = y(i) + (h/6)*(k1+2*k2+2*k3+k4);
    end

    for i = 4:1:n-1
        %Previsor
        yp = y(i) + (h/24)*(55*f(x(i),y(i)) - 59*f(x(i-1),y(i-1)) + 37*f(x(i-2),y(i-2)) - 9*f(x(i-3),y(i-3)));
        %Corretor
        yc = y(i) + (h/24)*(9*f(x(i+1),yp) + 19*f(x(i),y(i)) - 5*f(x(i-1),y(i-1)) + f(x(i-2),y(i-2)));
        y(i+1) = y(i) + (h/24)*(9*f(x(i+1),yc) + 19*f(x(i),y(i)) - 5*f(x(i-1),y(i-1)) + f(x(i-2),y(i-2)));
    end
    
    
    %NÃO FUNCIONA
    %for i = 1:1:n-1
        %Previsor P (Método explicito)
        %y(i+1) = y(i) + h * (funcao(x(i), y(i)));
    
        %for s = 1:1:3
        
            %Calcular f(i+1) E
            %f = funcao(x(i+1), y(i+1));
            %Corretor (Método Implicito)
            %y(i+1) = y(i) + h * f;
        %end
    %end



end

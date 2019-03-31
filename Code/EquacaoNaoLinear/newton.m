%{
    @description Encontrar o ponto zero de uma equação
    y_i - y_i+1 + hf(x_i+1, y_i+1) = 0, onde h, x_i+1, y_i são costantes,
    utilizando o método de newton, para
    generalizar a resolução do PVI para EDOs a cada passo.
%}
function y = newton(funcao, x0, Y, H)
    %exemplo entrada: newton(pi), x=0.73909 para f(x)=x-cos(x);
    % Erros, condições de parada.
    erro = 10^-16;
    errox = erro + 1;
    errof = erro + 1;
    y=NaN;
    yant = Y;
    %% NEWTON
    while errox > erro & errof > erro
        qk = derivada(funcao, x0, Y, yant, H);
        fx = f(funcao, x0, Y, yant, H);
        
        y = Y - fx/qk;
        
        errox = abs(y - Y)/abs(y);
        errof = abs(fx);
       
        Y = y;
    end
end
%% Calculo Aproximado da Derivada

function f = f(funcao, x, y, yant, h)
    f = -y + yant + h*funcao(x, y);
end

function d = derivada(funcao, x, y, yant, H)   
    h = 10^(-10);
    d = (f(funcao, x, y+h, yant, H) - f(funcao, x, y, yant, H))/h;
end
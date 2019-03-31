%{
    @description Resolução do sistema linear pelo método de JACOBI, na forma Ax = b.
    @param {MatrizA, vetorColuna}
    Verificar os criterios de convergencia...
%}
function [x] = jacobi(A,b)    
n=size(A);
n = n(1);
x0=zeros(n,1);
L=zeros(n);
R=zeros(n);
%Tolerancia
erro = 10^-20;
errox = erro + 1;
%% R - superior, L inferior , D - Diagonal
for i=1:1:n
    b(i,1)=b(i,1)/A(i,i);
    for j=1:1:n
        if j>i,R(i,j)=A(i,j)/A(i,i);
        else
            if i>j
                L(i,j)=A(i,j)/A(i,i);
            end
        end
    end
end
%% Convergencia
if conver((-(L+R)),n) == false, error('Matriz Diverge da Solução');end
%% JACOBI
while errox > erro
    x = -(L*x0 + R*x0) + b;
    errox=sum(abs(x-x0))/sum(abs(x));
    x0=x;
end
end       
%% Convergencia
function con = conver(B,n)
    con = true;
    %% Criterio das Linhas
    for i=1:1:n
        if norm(B(i,:))>=1
            con = false;
            break;     %Norma da linha <1 converge para solução
        end
    end
    if con == false %Uma apenas sendo valido, ira convergir
        %% Criterio das Colunas
        for i=1:1:n
            if norm(B(:,i))<1
                con=true;
                break;  %Norma da coluna <1 converge para solução
            end
        end
    end
end
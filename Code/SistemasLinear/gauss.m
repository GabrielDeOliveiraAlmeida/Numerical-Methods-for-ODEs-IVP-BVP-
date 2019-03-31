%{
    @description Resolução do sistema linear pelo método de GAUSS-SEIDEL, na forma Ax = b.
    @param {MatrizA, vetorColuna}
    Verificar os criterios de convergencia...
%}
function [x] = gauss(A,b)
  n=size(A);
  n = n(1);
  x0=zeros(n,1);
  L=zeros(n,n);
  R=zeros(n,n);
  D=zeros(n,n);
  I=eye(n);
  %Tolerancia
  erro = 10^-10;
  errox = erro + 1;
  %% R - superior, L inferior , D - Diagonal
  for i=1:1:n
    b(i,1)=b(i,1)/A(i,i);
    for j=1:1:n
        if j>i
            R(i,j)=A(i,j)/A(i,i);
        else
            if i>j
                L(i,j)=A(i,j)/A(i,i);
            else
                D(i,i)=A(i,i);
            end
        end
    end
  end
  %if sassenfeld(A,n) == false, error('N?o converge para solucao, (Criterio Sassenfeld) Encerrar o programa'); end
  %if linhas((-(L+R)),n) == false error('N?o converge para solucao, (Criterio das Linhas)'); end
  %% gaussSaidel
  x=x0;       %x=[0 0 .. n]^-1;
  xAnt=x;

  R= (L+I)^-1*R;
  L= ((L+I)^-1)*b;

  while errox>erro 
    x = -R*x + L;   %formula geral
   %x = b - L*x - R*xAnt;   %formula geral simplificada
    xAnt = x0;
    
    indiceMaior=1;
    indiceMaior2=1;
    
    sub=x-xAnt;
    maior2=abs(sub(1));
    maior=x(1);
    for i=2:1:n
        if maior2<abs(sub(i))
            maior2=abs(sub(i));
            indiceMaior=i;
        end
        if maior<abs(x(i))
            maior=abs(x(i));
            indiceMaior2=i;
        end
    end
    errox=(abs(x(indiceMaior)-xAnt(indiceMaior)))/abs(x(indiceMaior2));
    x0=x;
  end
end

%%% Convergencia
%function con = sassenfeld(A,n)
%  beta(1) = sum(abs(A(1,2:n)))/abs(A(1,1));
%  for i=2:1:n,   
%    soma=0;
%    for j=1:1:i-1,   %%Somatorio
%        soma = soma + abs(A(i,j))*beta(j);
%    end
%    beta(i)=(soma + sum(abs(A(i,i+1:n))))/abs(A(i,i)); 
%  end
%  maior = beta(1);
%  for i=2:1:n,  %%ENcontrar o maior beta
%    if maior<beta(i), maior=beta(i); end
%  end
%  if maior<1, con = true;  %converge para solução
%  else con=false; %diverge da solução
%  end
%end
%
%%% Criterio das Linhas
%function con = linhas(B,n)
%  con = true;
%  for i=1:1:n,
%    if norm(B(i,:))>=1, con = false; break;     %Norma da linha <1 converge para solu??o
%    end
%  end
%end  
%end  
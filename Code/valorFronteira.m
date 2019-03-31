function [y,x] = valorFronteira(I,F,p,q,a,b,c,funcao,alfa,beta,h) %[y,x]=valorFronteira(0,1,@(x) 1,@(x) x, @(x) 2*x,1,0,99);
  n = (F-I)/(h)-1;
  A = zeros(n,n);
  y = zeros(n,1);
  z = zeros(n,1);
  
  x(:,1) = I+h:h:F-h;

  A(1,1) = a(h,x(1));
  A(1,2) = c(h,x(1));
  A(n,n-1) = b(h,x(1));
  A(n,n) = a(h,x(1));

  z(1,1) = h*h*funcao(x(1)) - alfa*b(h,x(1));
  z(n,1) = h*h*funcao(x(n)) - beta*c(h,x(1));

  for i=2:1:n-1,
   
    A(i,i) = a(h,x(i));
    A(i,i-1) = b(h,x(i));
    A(i,i+1) = c(h,x(i));

    z(i,1)=h*h*funcao(x(i));
  end
    
  if trigonalDiagonalDominante(A,n) == true
     A
    %y = inv(A)*z;
    cd SistemasLinear;
    y = gauss(A,z);
    cd ..;
    %Ponto Inicial e Final
    x(2:n+1,1) = x(:,1);
    x(1,1) = I;
    x(n+2,1) = F;
    
    y(2:n+1,1) = y(:,1);
    y(1,1) = alfa;
    y(n+2,1) = beta;
    
  else
        
    fprintf("\nNao possui diagonal estritamente dominante\n");  
  end
end




%% Diagonal Estritamente DOminante
function trigonal = trigonalSolucao(A,n)
  trigonal = true;
  if abs(A(1,1)) <= abs(A(1,2)), trigonal=false;
  elseif abs(A(n,n))<= abs(A(n,n-1)), trigonal= false;
  else
  for i=2:1:n-1,
    if abs(A(i,i)) <= abs(A(i,i+1)) | abs(A(i,i)) <= abs(A(i,i-1)),
      trigonal = false;
      break;
    end
   end
  end
end
%% Diagonal Dominante E |a(n)| > |b(n)|
function trigonal = trigonalDiagonalDominante(A,n)
  trigonal = true;
  if abs(A(1,1)) < abs(A(1,2)), trigonal=false;
  elseif abs(A(n,n))<= abs(A(n,n-1)), trigonal= false;
  else
  for i=2:1:n-1,
    if abs(A(i,i)) < abs(A(i,i+1)) | abs(A(i,i)) < abs(A(i,i-1)),
      trigonal = false;
      break;
    end
  end
  end
end

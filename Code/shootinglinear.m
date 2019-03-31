function [y,xs] = shootinglinear(I,F,p,q,r,alfa,beta,h, tolerancia, maxiteracoes)
  %Espacamento, Tamanho de passos;    
n = (F-I)/(h)+1;
%Declaracao vetores

u = zeros(2,n);

v = zeros(2,n);
w = zeros(2,n);
xs(:,1) = I:h:F;
tk =(beta - alfa)/(F-I);
cont =0;

    u(1,1) = alfa;
    u(2,1) = tk;
    v(1,1) = 0;
    v(2,1) = 1;

for i=1:1:n-1
        x = xs(i);
        k(1,1) = h*u(2,i);
        k(1,2) = h*(p(x)*u(2,i) + q(x)*u(1,i) + r(x));
        k(2,1) = h*(u(2,i)+0.5*k(1,2));
        k(2,2) = h*(p(x+h/2)*(u(2,i) + 0.5*k(1,2)) + q(x+h/2)*(u(1,i)+0.5*k(1,1)) + r(x+h/2));
        k(3,1) = h*(u(2,i) + 0.5*k(2,2));
        k(3,2) = h*(p(x + h/2)*(u(2,i)+0.5*k(2,2))+ q(x+h/2)*(u(1,i)+0.5*k(2,1))+r(x+h/2));
        k(4,1) = h*(u(2,i) + k(3,2));
        k(4,2) = h*(p(x+h)*(u(2,i)+k(3,2))+q(x+h)*(u(1,i)+k(3,1))+r(x+h));
        u(1,i+1) = u(1,i) + 1/6*(k(1,1) + 2*k(2,1) + 2*k(3,1) + k(4,1));
        u(2,i+1) = u(2,i) + 1/6*(k(1,2) + 2*k(2,2) + 2*k(3,2) + k(4,2));
        
        kl(1,1) = h*v(2,i);
        kl(1,2) = h*(p(x)*v(2,i) + q(x)*v(1,i));
        kl(2,1) = h*(v(2,i)+0.5*kl(1,2));
        kl(2,2) = h*(p(x+h/2)*(v(2,i) + 0.5*kl(1,2)) + q(x+h/2)*(v(1,i)+0.5*kl(1,1)));
        kl(3,1) = h*(v(2,i) + 0.5*kl(2,2));
        kl(3,2) = h*(p(x + h/2)*(v(2,i)+0.5*kl(2,2))+ q(x+h/2)*(v(1,i)+0.5*kl(2,1)));
        kl(4,1) = h*(v(2,i) + kl(3,2));
        kl(4,2) = h*(p(x+h)*(v(2,i)+kl(3,2))+q(x+h)*(v(1,i)+kl(3,1)));
        v(1,i+1) = v(1,i) + 1/6*(kl(1,1) + 2*kl(2,1) + 2*kl(3,1) + kl(4,1));
        v(2,i+1) = v(2,i)  + 1/6*(kl(1,2) + 2*kl(2,2) + 2*kl(3,2) + kl(4,2));
end

    w(1,1) = alfa;
    w(2,1) = (beta - u(1,n))/v(1,n);
        for i=1:1:n
    		y(i,1) = u(1,i) + w(2,1)*v(1,i);
    		y(i,2) = u(2,i) + w(2,1)*v(2,i);
        end
    
end

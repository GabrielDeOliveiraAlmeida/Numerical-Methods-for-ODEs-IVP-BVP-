function y = exata(x, funcao)
%EXATA Summary of this function goes here
%   Detailed explanation goes here
tam = size(x);
y = zeros(tam(1),1);
for i=1:1:tam(1)
   y(i) = funcao(x(i));
end
end


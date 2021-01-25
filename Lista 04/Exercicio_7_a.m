clear all
L = 1;
k = 1;
f=0;
T_inf = 25;
T_topo = 500;
T_esq = 250;
T_dir = 100;
N = 100;
h = L/N;
J = N;
I = J;
A = zeros((J-1)*(I-1),(J-1)*(I-1));
b = zeros((J-1)*(I-1),1);
linha = 1;
for j = 1:(J-1)
for i = 1:(I-1)
if j == 1
if i == 1
A(1,1) = -4;
A(1,2) = 1;
A(1,I) = 1;
b(1) = f-(T_esq + T_topo);
linha = linha+1;
elseif i<(I-1)
A(linha,(j-1)*(I-1)+(i-1)) = 1;
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,j*(I-1)+i) = 1;
A(linha,(j-1)*(I-1)+(i+1)) = 1;
b(linha) = f-T_topo;
linha = linha+1;
else
A(linha,(j-1)*(I-1)+(i-1)) = 1;
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,j*(I-1)+i) = 1;
b(linha) = f-(T_topo+T_dir);
linha = linha+1;
end
elseif j<(J-1)
if i == 1
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,j*(I-1)+i) = 1;
A(linha,(j-1)*(I-1)+(i+1)) = 1;
A(linha,(j-2)*(I-1)+i) = 1;
b(linha) = f-T_esq;
linha = linha+1;
elseif i<(I-1)
A(linha,(j-1)*(I-1)+(i-1)) = 1;
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,j*(I-1)+i) = 1;
A(linha,(j-1)*(I-1)+(i+1)) = 1;
A(linha,(j-2)*(I-1)+i) = 1;
b(linha)=f;
linha = linha+1;
else
A(linha,(j-1)*(I-1)+(i-1)) = 1;
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,j*(I-1)+i) = 1;
A(linha,(j-2)*(I-1)+i) = 1;
b(linha) = f-T_dir;
linha = linha+1;
end
else
if i == 1
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,(j-1)*(I-1)+(i+1)) = 1;
A(linha,(j-2)*(I-1)+i) = 1;
b(linha) = f-(T_inf+T_esq);
linha = linha+1;
elseif i<(I-1)
A(linha,(j-1)*(I-1)+(i-1)) = 1;
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,(j-1)*(I-1)+(i+1)) = 1;
A(linha,(j-2)*(I-1)+i) = 1;
b(linha) = -(T_inf);
linha = linha+1;
else
A(linha,(j-1)*(I-1)+(i-1)) = 1;
A(linha,(j-1)*(I-1)+i) = -4;
A(linha,(j-2)*(I-1)+i) = 1;
b(linha) = -(T_inf+T_dir);
linha = linha+1;
end
end
end
end
x = A\b;
T = zeros(J+1,I+1);
T(1,:) = T_topo;
T(2:(J+1),1) = T_esq;
T(2:(J+1),(I+1)) = T_dir;
T((J+1),:)=T_inf;
for j = 1:(J-1)0
T(j+1,2:I) = x(((j-1)*(I-1)+1):(j*(I-1)))';
end
x1 = 0:h:L;
x2 = 0:h:L;
[X1,X2] = meshgrid(x1,x2);
surf(X1,X2,T);
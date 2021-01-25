nc=5;
N=10;
F = 1000;
D = 500;
B = 500;
L = 1250;
V = 1750;
Llinha=F+L;
A=zeros(2*nc*(N+1),2*nc*(N+1));
b = zeros(2*nc*(N+1),1);
z = [0.06;0.17;0.22;0.2;0.35];
nf = 6;
alfa = [0.7,2.21,1.5,0.86,0.71];
beta = [0.3e-2,1.95e-2,-1.6e-2,-0.97e-2,-0.87e-2]; 
gama = [0.65e-4,0.9e-4,0.8e-4,0.46e-4,0.42e-4];
temp = linspace(140,230,(N+1));
for j = 1:N+1
    for i = 1:nc
        if j == 1
            A(nc*(j-1)+i,nc*(j-1)+i) = -L;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j-1)+i) = (L-V);
            A(nc*(j-1)+i,nc*(N+1)+nc*(j)+i) = V;
        elseif j < nf
            A(nc*(j-1)+i,nc*(j-2)+i) = L;
            A(nc*(j-1)+i,nc*(j-1)+i) = -L;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j-1)+i) = -V;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j)+i) = V;
        elseif j == nf 
            A(nc*(j-1)+i,nc*(j-2)+i) = L;
            A(nc*(j-1)+i,nc*(j-1)+i) = -Llinha;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j-1)+i) = -V;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j)+i) = V;
            b(nc*(j-1)+i,1) = -F*z(i,1);
        elseif j > nf && j < N+1
            A(nc*(j-1)+i,nc*(j-2)+i) = Llinha;
            A(nc*(j-1)+i,nc*(j-1)+i) = -Llinha;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j-1)+i) = -V;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j)+i) = V;
        else j == N+1
            A(nc*(j-1)+i,nc*(j-2)+i) = Llinha;
            A(nc*(j-1)+i,nc*(j-1)+i) = -B;
            A(nc*(j-1)+i,nc*(N+1)+nc*(j-1)+i) = -V;
        end
    end
end
for j = 1:N+1
    for i = 1:nc
        A(nc*(N+1)+(nc*(j-1))+i,nc*(j-1)+i) = alfa(i)+beta(i)*temp(j)+gama(i)*(temp(j).^2);
        A(nc*(N+1)+(nc*(j-1))+i,nc*(N+1)+nc*(j-1)+i) = -1;
    end
end
x = A\b;
xb = x(nc*(N)+1:nc*(N)+5,1)
xd = x(nc*(N+1)+1:nc*(N+1)+5,1)
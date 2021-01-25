n = 9;
F = 100;
z = [0.8345,0.0046,0.0381,0.0163,0.005,0.0074,0.0287,0.022,0.0434];
K = [3.09,1.65,0.72,0.39,0.21,0.175,0.093,0.065,0.036];
V = newton_num('destiladorflash',0.5,83,1e-4)
L = F-V;
A=zeros(2*n,2*n);
b =zeros(2*n,1);
 for i = 1:n
     A(i,i) = L;
     A(i,i+n) = V;
     b(i) = F*z(i);
 end
 for i = 1:n
     A(n+i,i) = K(i);
     A(n+i,n+i) = -1;
 end
 x = A\b;
 X = x(1:9,1)
 somaX=sum(X)
 Y = x(10:18,1)
 somaY=sum(Y)
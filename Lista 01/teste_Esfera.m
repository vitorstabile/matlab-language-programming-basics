[X,Y] = meshgrid(-10:10);
Z = (-(X.^2) -(Y.^2)+4)^1/2;
surf(X,Y,Z)
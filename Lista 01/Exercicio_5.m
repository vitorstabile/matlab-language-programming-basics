x = [1,5,2,8,9,5,1];
y = [5,2,2,6,0,0,2];
%Explicar o resultado x > y
x>y
%o mesmo compara os valores de cada membro do vetor linha x com os membros do vetor
%linha y, mediante o uso do operador logico >. Logo, para valores 0, o resultado � falso. Para valores 1, o
%resultado � verdadeiro. Como 1>5, 2>2 e 1>2, s�o condi��es falsas, sabemos
%que o resultado sera 0.Como 5>2, 8>6, 9>0, e s�o condi��es verdadeiras, o
%resultado ser� 1.
%Explicar o resultado x == y
x == y
%o mesmo compara os valores de cada membro do vetor linha x com os membros do vetor
%linha y, mediante o uso do operador logico ==. Logo, para valores 0, o resultado � falso. Para valores 1, o
%resultado � verdadeiro. Como 2==2, � uma condi��o verdadeira, sabemos
%que o resultado sera 1.
%Explicar p rsultado (x>y)&(x<8)
(x>y)&(x<8)
%o mesmo compara os valores de cada membro do vetor linha x com os membros do vetor
%linha y, mediante o uso do operador logico >, e se os valores do vetor x<8.  
%Satisfeita essas DUAS condi��es, o resultado � verdadeiro, ou seja, 1.
%Caso contrario, sera 0
%Como os unicos valores do vetor x que s�o maiores do que o vetor y, e
%menores que 8, s�o os valores, 5 da coluna 2 e 5 da coluna 6. Os resultados s�o verdadeiros 

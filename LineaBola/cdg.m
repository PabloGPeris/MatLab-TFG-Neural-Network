function resultado = cdg(A)
%CDG Centro de gravedad de un vector
if isrow(A)
    A = A';
elseif ~iscolumn(A)
    error('Debe ser vector fila o columna');
end

if sum(A) == 0
    resultado = -50;
else
    resultado = 0;
    for i = 1:length(A)
        resultado = resultado + (i)*A(i);
    end
    resultado = resultado/sum(A);
end

end


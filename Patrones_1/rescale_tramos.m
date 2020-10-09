function outputImg = rescale_tramos(inputImg, minimo, maximo)
%outputImg = rescale_tramos(inputImg, min, max)
%   Reescala una imagen (o un vector cualquiera) entre el mínimo y el
%   máximo especificados, pero mantiene el valor mínimo a 0.

outputImg = rescale(inputImg, minimo, maximo);

for i = 1:size(outputImg,1)
    for j = 1:size(outputImg,2)
        if outputImg(i,j) <= minimo + 0.01 % por si acaso
            outputImg(i,j) = 0;
        end
    end
end
end


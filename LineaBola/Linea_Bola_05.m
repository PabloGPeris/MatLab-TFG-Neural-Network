%% Linea Bola 05 - Guardado de imágenes en carpetas

clear
clc
close all


load LineaBola_img

%%

NBolas = length(imagenesBolas);
NLineas = length(imagenesLineas);

for i = 1:NBolas
    img = imagenesBolas{i};   
    str = strcat('.\imgLineaBola\imgBolas\Bola_', num2str(i), '.png');
    imwrite(img, str);
end

for i = 1:NLineas
    img = imagenesLineas{i};   
    str = strcat('.\imgLineaBola\imgLineas\Linea_', num2str(i), '.png');
    imwrite(img, str);
end
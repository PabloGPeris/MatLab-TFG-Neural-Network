%% Linea Bola 11 - Guardado de imágenes en carpetas

clear
clc
close all


load LineaBolaDonut_img

%%

NBolas = length(imagenesBolas);
NLineas = length(imagenesLineas);
NDonuts = length(imagenesDonuts);

for i = 1:NBolas
    img = imagenesBolas{i};   
    str = strcat('.\imgLineaBolaDonut\Bola\Bola_', num2str(i), '.png');
    imwrite(img, str);
end

for i = 1:NLineas
    img = imagenesLineas{i};   
    str = strcat('.\imgLineaBolaDonut\Linea\Linea_', num2str(i), '.png');
    imwrite(img, str);
end

for i = 1:NDonuts
    img = imagenesDonuts{i};   
    str = strcat('.\imgLineaBolaDonut\Donut\Donut_', num2str(i), '.png');
    imwrite(img, str);
end
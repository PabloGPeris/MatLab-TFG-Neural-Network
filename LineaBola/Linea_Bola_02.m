%% Línea Bola 02 - Pretratamiento de datos

clear
clc
close all


load LineaBola_img

%% Pretratamiento de bolas
N = length(imagenesBolas);
ancho = size(imagenesBolas{1},2);
% alto = size(imagenesBolas{i},1);


datosBolas = zeros(ancho,N);

for i = 1:N
    for j = 1:ancho
       datosBolas(j,i) = cdg(imagenesBolas{i}(:,j)); 
    end
end

%% Pretratamiento de líneas
N = length(imagenesLineas);
ancho = size(imagenesLineas{1},2);
% alto = size(imagenesLineas{i},1);


datosLineas = zeros(ancho,N);

for i = 1:N
    for j = 1:ancho
       datosLineas(j,i) = cdg(imagenesLineas{i}(:,j)); 
    end
end

%% Guarda los datos
save LineaBola_data datosBolas datosLineas
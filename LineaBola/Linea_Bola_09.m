%% Línea Bola 09 - Pretratamiento de datos - Bola, Línea (inclinada) y Donut

clear
clc
close all


load LineaBolaDonut_img

%% Pretratamiento de bolas
N = length(imagenesBolas);
ancho = size(imagenesBolas{1},2);


datosBolas = zeros(3*ancho,N);

for i = 1:N
    for j = 1:ancho
       datosBolas(j,i) = cdg(imagenesBolas{i}(:,j)); 
    end
end
for i = 1:N
   datosBolas(ancho+1:2*ancho,i) = mean(imagenesBolas{i})'; 
end
for i = 1:N
   datosBolas(2*ancho+1:3*ancho,i) = std(imagenesBolas{i})'; 
end

%% Pretratamiento de líneas
N = length(imagenesLineas);
ancho = size(imagenesLineas{1},2);


datosLineas = zeros(3*ancho,N);

for i = 1:N
    for j = 1:ancho
       datosLineas(j,i) = cdg(imagenesLineas{i}(:,j)); 
    end
end
for i = 1:N
   datosLineas(ancho+1:2*ancho,i) = mean(imagenesLineas{i})'; 
end
for i = 1:N
   datosLineas(2*ancho+1:3*ancho,i) = std(imagenesLineas{i})'; 
end

%% Pretratamiento de donuts
N = length(imagenesDonuts);
ancho = size(imagenesDonuts{1},2);

datosDonuts = zeros(3*ancho,N);

for i = 1:N
    for j = 1:ancho
       datosDonuts(j,i) = cdg(imagenesDonuts{i}(:,j)); 
    end
end
for i = 1:N
   datosDonuts(ancho+1:2*ancho,i) = mean(imagenesDonuts{i})'; 
end
for i = 1:N
   datosDonuts(2*ancho+1:3*ancho,i) = std(imagenesDonuts{i})'; 
end

%% Guarda los datos
save LineaBolaDonut_data datosBolas datosLineas datosDonuts
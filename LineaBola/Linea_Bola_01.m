%% Línea Bola 01 - Generación de Datos

clear
clc
close all

% rng('shuffle');
rng('default');
%% Bolas

imagenesBolas = cell(1,100); %100 ejemplos
for i = 1:100 
    % Centro
    centre = randi(50,1,2);

    % Distribuciones normales en torno al centro
    nd1 = makedist('normal', 'mu', centre(1), 'sigma', 4);
    nd1 = truncate(nd1, 0.51, 50.49);
    nd2 = makedist('normal', 'mu', centre(2), 'sigma', 4);
    nd2 = truncate(nd2, 0.51, 50.49);
    
    % Generación de imágenes
    imagenesBolas{i} = zeros(50,50);
    for j = 1:250
        pos = round([random(nd1) random(nd2)]); %elige un punto al azar según una distribución normal en torno al centro
        if imagenesBolas{i}(pos(1),pos(2)) < 1
            imagenesBolas{i}(pos(1),pos(2)) = imagenesBolas{i}(pos(1),pos(2)) + 0.25;
        end
    end
end

% Dibujo de 4 figuras
figure;
for i = 1:4
    subplot(2,2,i);
    imshow(imagenesBolas{randi(100)});
    title(['Bolas ', num2str(i)]);
end


% imwrite(img, 'Bola.png');
% img = imread('Bola.png');
% figure;
% imshow(img);

% x = 1:0.1:50;
% y = pdf(nd,x);
% plot(x,y);

% puntos = zeros(300,2);
% 
% for i = 1:300
%    puntos(i,:) = [random(nd1) random(nd2)];
% end

%% Líneas

imagenesLineas = cell(1,100); %100 ejemplos
for i = 1:100 
    % Centro
    centre = randi(50);
    
    % Distribuciones normales en torno al centro (eje)
    nd1 = makedist('normal', 'mu', centre(1), 'sigma',3);
    nd1 = truncate(nd1, 0.51, 50.49);

    
    % Generación de imágenes
    imagenesLineas{i} = zeros(50,50);
    for j = 1:400
        pos = round([random(nd1) randi(50)]);
        if imagenesLineas{i}(pos(1),pos(2)) < 1
            imagenesLineas{i}(pos(1),pos(2)) = imagenesLineas{i}(pos(1),pos(2)) + 0.25;
        end
    end
end

% Dibujo de 4 figuras
figure;
for i = 1:4
    subplot(2,2,i);
    imshow(imagenesLineas{randi(100)});
    title(['Lineas ', num2str(i)]);
end

%% Guarda los datos
save LineaBola_img imagenesBolas imagenesLineas

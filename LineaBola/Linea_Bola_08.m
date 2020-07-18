%% Línea Bola 08 - Generación de Datos - Bola, Línea (inclinada) y Donut

clear
clc
close all

% rng('shuffle');
rng('default');
%%
Nejemplos = 100;
%% Bolas (tamaño variable)
imagenesBolas = cell(1,Nejemplos); 
for i = 1:Nejemplos 
    
    % Centro
    centre = randi(50,1,2);

    % Distribuciones normales en torno al centro de sigma aleatorio
    sigma = rand*4 + 2;
    nd1 = makedist('normal', 'mu', centre(1), 'sigma', sigma);
    nd1 = truncate(nd1, 0.51, 50.49);
    nd2 = makedist('normal', 'mu', centre(2), 'sigma', sigma);
    nd2 = truncate(nd2, 0.51, 50.49);
    
    % Generación de imágenes
    imagenesBolas{i} = zeros(50,50);
    for j = 1:300
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
    imshow(imagenesBolas{randi(50)});
    title(['Bolas ', num2str(i)]);
end
%% Líneas (inclinadas)

imagenesLineas = cell(1,Nejemplos); 
for i = 1:Nejemplos 
    % Parámetros
    origen = randi(40) + 5;
    fin = randi(40) + 5;
    pte = (fin - origen)/49;
    

    % Generación de imágenes
    imagenesLineas{i} = zeros(50,50);
    for j = 1:400
        x = randi(50);
        y = origen + pte*(x-1);
        
        % Distribuciones normales en torno al punto (x,y), en las y
        nd1 = makedist('normal', 'mu', y, 'sigma',3);
        nd1 = truncate(nd1, 0.51, 50.49);
        
        pos = round([random(nd1) x]);
        if imagenesLineas{i}(pos(1),pos(2)) < 1
            imagenesLineas{i}(pos(1),pos(2)) = imagenesLineas{i}(pos(1),pos(2)) + 0.25;
        end
    end
end

%% Dibujo de 4 figuras
figure;
for i = 1:4
    subplot(2,2,i);
    imshow(imagenesLineas{randi(50)});
    title(['Lineas ', num2str(i)]);
end

%% Donuts

imagenesDonuts = cell(1,Nejemplos); 

for i = 1:Nejemplos 
    % Centro
    centre = randi(50,1,2);
    % Radio medio
    radio = rand*9 + 2;
    
    % Distribución normal para coordenadas polares en torno al centro
    nd1 = makedist('normal', 'mu', radio, 'sigma', 1);
    nd1 = truncate(nd1, 0, 15);

    % Generación de imágenes
    imagenesDonuts{i} = zeros(50,50);
    for j = 1:250
        
        % Módulo y argumento en polares respecto el centro
        r = random(nd1);
        theta = rand*2*pi;
        
        % Paso a cartesianas
        x = centre(1) + r*cos(theta);
        y = centre(2) + r*sin(theta);
        
        
        pos = round([x y]); %elige un punto al azar según una distribución normal en torno al centro
        
        if pos(1) >= 1 && pos(1) <= 50 && pos(2) >= 1 && pos(2) <= 50
            if imagenesDonuts{i}(pos(1),pos(2)) < 1
                imagenesDonuts{i}(pos(1),pos(2)) = imagenesDonuts{i}(pos(1),pos(2)) + 0.25;
            end
        end
    end
end

%% Dibujo de 4 figuras
figure;
for i = 1:4
    subplot(2,2,i);
    imshow(imagenesDonuts{randi(50)});
    title(['Donuts ', num2str(i)]);
end

%% Guardado de datos
save LineaBolaDonut_img imagenesBolas imagenesLineas imagenesDonuts

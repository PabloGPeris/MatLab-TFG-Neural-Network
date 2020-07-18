%% Linea Bola 04 - Red directamente conectada a los inputs tal cual

clear
clc
close all


load LineaBola_img

%% Pretratamiento de bolas

NBolas = length(imagenesBolas);
sizeBolas = size(imagenesBolas{1},1)*size(imagenesBolas{1},2);

datosBolas = zeros(sizeBolas,NBolas);
for i = 1:NBolas 
    datosBolas(:,i) = reshape(imagenesBolas{i}, [], 1);
end

%% Pretratamiento de líneas

NLineas = length(imagenesLineas);
sizeLineas = size(imagenesLineas{1},1)*size(imagenesLineas{1},2);

datosLineas = zeros(sizeLineas,NLineas);
for i = 1:NLineas
    datosLineas(:,i) = reshape(imagenesLineas{i}, [], 1);
end

%% Inputs y outputs

NBolas = length(imagenesBolas);
NLineas = length(imagenesLineas);

datos = [datosBolas, datosLineas]; %inputs
clases = blkdiag(ones(1, NBolas), ones(1, NLineas)); %outputs

%% Red neuronal sencilla

net = network(1,1,1,1,0,1);
net.layers{1}.transferFcn = 'logsig';
net.inputs{1}.range = [zeros(1,sizeBolas); ones(1,sizeBolas)]';
net.trainFcn = 'trainlm';

net = train(net, datos, clases);

%% Comprobación de correcta clasificación (según datos)
imagenes = [imagenesBolas imagenesLineas];

figure;
for i = 1:4
    rd = randi(200);% número aleatorio
    subplot(2,2,i);
    imshow(imagenes{rd});
    
    % clasifica la imagen obtenida aleatoriamente (según el pretratamiento
    % dado)
    Y = net(datos(:,rd));
    
    if Y(1) > Y(2)
        title(['Es una bola al ', num2str(Y(1)*100), '%']);
    else
        title(['Es una línea al ', num2str(Y(2)*100), '%']);
    end
    
end

%%
save LineaBola_ShallowNet datos clases net
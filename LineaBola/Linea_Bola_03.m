%% Línea Bola 03 - Perceptron

clear
clc
close all


load LineaBola_img
load LineaBola_data
%% Inputs y outputs
NBolas = length(imagenesBolas);
NLineas = length(imagenesLineas);

datos = [datosBolas, datosLineas]; %inputs
clases = blkdiag(ones(1, NBolas), ones(1, NLineas)); %outputs

% %%
% nnstart

%% Perceptron
net = perceptron;

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

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

% Usar help network/network para ver cómo hacer una red

%% Guardar datos
save LineaBola_perceptron datos clases net


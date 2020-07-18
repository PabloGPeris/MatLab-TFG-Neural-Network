%% Línea Bola 10 - Perceptron - Bola, Línea (inclinada) y Donut

clear
clc
close all


load LineaBolaDonut_img
load LineaBolaDonut_data
%% Inputs y outputs
NBolas = length(imagenesBolas);
NLineas = length(imagenesLineas);
NDonuts = length(imagenesDonuts);

datos = [datosBolas, datosLineas, datosDonuts]; %inputs
clases = blkdiag(ones(1, NBolas), ones(1, NLineas), ones(1, NDonuts)); %outputs

%% Empieza
% nnstart

%% Red neuronal
x = datos;
t = clases;

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

% Create a Pattern Recognition Network
hiddenLayerSize = 5;
net = patternnet(hiddenLayerSize, trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y)
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
figure, plotconfusion(t,y)
%figure, plotroc(t,y)
net = train(net, datos, clases);

%% Comprobación de correcta clasificación (según datos)
imagenes = [imagenesBolas imagenesLineas imagenesDonuts];

figure;
for i = 1:4
    rd = randi(150);% número aleatorio
    subplot(2,2,i);
    imshow(imagenes{rd});
    
    % clasifica la imagen obtenida aleatoriamente (según el pretratamiento
    % dado)
    Y = net(datos(:,rd));
    
    if Y(1) > Y(2) && Y(1) > Y(3)
        title(['Es una bola al ', num2str(Y(1)*100), '%']);
    elseif Y(2) > Y(3)
        title(['Es una línea al ', num2str(Y(2)*100), '%']);
    else
        title(['Es un donut al ', num2str(Y(3)*100), '%']);
    end
    
end

% Usar help network/network para ver cómo hacer una red

%% Guardar datos
save LineaBolaDonut_shallow datos clases net
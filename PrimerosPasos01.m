%% Primeros pasos siguiendo el tutorial de MatLab de su toolbox de Deep Learning

clear
clc
close all

load Net01


%% Comienza la fiesta
% net = googlenet;

% deepNetworkDesigner

%% Carga de datos

% unzip('MerchData.zip');
imds = imageDatastore('MerchData','IncludeSubfolders',true,'LabelSource','foldernames'); % obtiene los datos
[imdsTrain,imdsValidation] = splitEachLabel(imds,0.7,'randomized'); %separa en entrenar y validar (70 % entreno)

%Ajusta al tamaño correcto
augimdsTrain = augmentedImageDatastore([224 224],imdsTrain);
augimdsValidation = augmentedImageDatastore([224 224],imdsValidation);


options = trainingOptions('sgdm', ...
    'MiniBatchSize',10, ...
    'MaxEpochs',6, ...
    'Shuffle','every-epoch', ...
    'InitialLearnRate',1e-4, ...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',6, ...
    'Verbose',false, ...
    'Plots','training-progress');


netTransfer = trainNetwork(augimdsTrain,lgraph_1,options);

%% Test

[YPred,probs] = classify(netTransfer,augimdsValidation);
accuracy = mean(YPred == imdsValidation.Labels)

idx = randperm(numel(imdsValidation.Files),4);
figure
for i = 1:4
    subplot(2,2,i)
    I = readimage(imdsValidation,idx(i));
    imshow(I)
    label = YPred(idx(i));
    title(string(label) + ", " + num2str(100*max(probs(idx(i),:)),3) + "%");
end

save Net01 lgraph_1 netTransfer

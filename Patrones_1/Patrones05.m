%% Patrones 05 - Muchas redes

%% Load Initial Parameters

% load datosDimensiones
% load redes

resolucion = 128;
format shortG

%% Import Data

imdsUsables = imageDatastore("imgPatronesLog","IncludeSubfolders",true,"LabelSource","foldernames");
% [imdsTrain, imdsValidation] = splitEachLabel(imdsTrain,0.7);
% 
% %% Augmentation Settings
% imageAugmenter = imageDataAugmenter(...
%     "RandXReflection",false,...
%     "RandYReflection",false);
% 
% % Resize the images to match the network input layer.
% augimdsTrain = augmentedImageDatastore([resolucion resolucion 1],imdsTrain,"DataAugmentation",imageAugmenter);
% augimdsValidation = augmentedImageDatastore([resolucion resolucion 1],imdsValidation);


%% Loop

resul = [];

%%
for i = 0.775:0.025:0.85
   
                [imdsTrain, imdsValidation] = splitEachLabel(imdsUsables,i);

                %% Set Training Options

                opts = trainingOptions("sgdm",...
                    "ExecutionEnvironment","auto",...
                    "InitialLearnRate",0.01,...
                    "MaxEpochs",3,...
                    "Shuffle","every-epoch",...
                    "ValidationFrequency",20,...
                    "Plots","none",...
                    "ValidationData",imdsValidation,...
                    "Verbose", false); 
                
                
                layers = [

                imageInputLayer([resolucion resolucion 1], "Normalization", "rescale-zero-one")

                convolution2dLayer([3 3],8,"Padding","same")
                maxPooling2dLayer([2 2],"Padding","same","Stride",[2 2])
                reluLayer
                batchNormalizationLayer

                convolution2dLayer([3 3],16,"Padding","same")
                maxPooling2dLayer([2 2],"Padding","same","Stride",[2 2])
                reluLayer
                batchNormalizationLayer

                convolution2dLayer([3 3],32,"Padding","same")
                maxPooling2dLayer([2 2],"Padding","same","Stride",[2 2])
                reluLayer
                batchNormalizationLayer

%                 convolution2dLayer([3 3],2^l,"Padding","same")
%                 maxPooling2dLayer([2 2],"Padding","same","Stride",[2 2])
%                 reluLayer
%                 batchNormalizationLayer
                
%                 fullyConnectedLayer(2^k)
%                 reluLayer
%                 batchNormalizationLayer

                fullyConnectedLayer(6)
                softmaxLayer
                classificationLayer];


                %% Train Network
                [net, traininfo] = trainNetwork(imdsTrain,layers,opts);

                %% Test
                [YPred,probs] = classify(net,imdsValidation);
                accuracy = mean(YPred == imdsValidation.Labels); %#ok<*NOPTS>
                
                resulpre = [i accuracy]
                resul = [resul; resulpre];
                
                
%             end
%         end
%     end
end
%%
plot(resul(:,1), resul(:,2));

save ResultadosRGBMini resul

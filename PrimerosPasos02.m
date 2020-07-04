%% Probando simplemente la red neuronal de Google (googlenet)

clear
clc
close all

net = googlenet;%googlenet


Image = imread('Pizza.jpg');
inputSize = net.Layers(1).InputSize;
Image = imresize(Image,inputSize(1:2));


[label,prob] = classify(net, Image);
figure;
imshow(Image)
title(string(label) + ' ' + num2str(max(prob)*100,3) + '% \n')

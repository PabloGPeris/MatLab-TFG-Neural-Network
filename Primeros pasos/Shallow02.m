%%
clear
clc
close all
%%
[X,T] = bodyfat_dataset;

%% Innecesario
setdemorandstream(491218382)

%%
net = fitnet(15);
view(net)

%%
[net,tr] = train(net,X,T);
nntraintool
% nntraintool('close')

%%
testX = X(:,tr.testInd);
testT = T(:,tr.testInd);

testY = net(testX);

perf = mse(net,testT,testY)

%%
Y = net(X);

plotregression(T,Y)

%%
e = T - Y;

ploterrhist(e)
%%

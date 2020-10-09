function outputImg = rescale_a_partir(inputImg, minimo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

outputImg = rescale(inputImg);

for i = 1:size(outputImg,1)
    for j = 1:size(outputImg,2)
        if outputImg(i,j) <= minimo
            outputImg(i,j) = 0;
        end
    end
end
end


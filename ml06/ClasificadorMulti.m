function ClasificadorMulti()
    clear;
    close all;
    clc;
    
    NumeroDeClases = 10;
    
    load('digitos.mat');
    
    figure;
    subplot(2,2,1);
    imshow(reshape(x(500,:),20,20));
    subplot(2,2,2);
    imshow(reshape(x(1200,:),20,20));
    subplot(2,2,3);
    imshow(reshape(x(1900,:),20,20));
    subplot(2,2,4);
    imshow(reshape(x(3000,:),20,20));
    
    m = length(y);
    
    
end
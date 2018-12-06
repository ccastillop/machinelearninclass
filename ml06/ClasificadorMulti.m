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
    
    n = size(x,2) + 1;
    x = [ones(m,1) x];
    thetas = zeros(n, NumeroDeClases);
    
    for clase = 1:NumeroDeClases
        theta = zeros(n,1);
        [theta, J] = GradienteDescendente(x, y==clase, theta, 0.01, 2000);
        thetas(:,clase) = theta;
    end
    
    %predicciones
    pred = FuncionSigmoidal(x * thetas);
    [u, p] = max(pred,[],2); 
    mean(double(p==y))
    
    save('thetas.mat','thetas');
    
end
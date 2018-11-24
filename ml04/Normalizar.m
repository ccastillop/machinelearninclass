function [X_normalizado, mu, sigma] = Normalizar(x)
    %inicializando matrices
    X_normalizado = x;
    mu = zeros(1,size(x,2)); 
    sigma = zeros(1,size(x,2));
    
    %cálculo
    mu = mean(x);
    sigma = std(x);
    for j = 1:size(x,2)
        X_normalizado(:,j) = (x(:,j) - mu(j) ) / sigma(j);
    end
end


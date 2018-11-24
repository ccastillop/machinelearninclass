function [XNormalizado, mu, sigma] = Normalizar(x)
    %inicializando matrices
    XNormalizado = x;
    mu = zeros(1,size(x,2)); 
    sigma = zeros(1,size(x,2));
    
    %cálculo
    mu = mean(x);
    sigma = std(x);
    for j = 1:size(x,2)
        XNormalizado(:,j) = (x(:,j) - mu(j) ) / sigma(j);
    end
end


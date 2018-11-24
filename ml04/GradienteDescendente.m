function [theta, JHistorico] = GradienteDescendente(x, y, theta, alpha, max_iteraciones)
    %inicializando
    JHistorico = zeros(max_iteraciones, 1);
    m = length(y); 
    for k = 1:max_iteraciones
        theta = theta - ((alpha / m) * (x * theta - y)' * x)';
        JHistorico(k) = CalculaCosto(x, y, theta);
    end
end
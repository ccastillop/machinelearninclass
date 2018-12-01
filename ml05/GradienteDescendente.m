function [theta, jHistorico] = GradienteDescendente(x, y, theta, alpha, iteraciones)
    m = length(y);
    JHistorico = zeros(iteraciones, 1);
    for iter = 1 : iteraciones
        h = FuncionSigmoidal(x * theta);
        gradiente = ((h-y)' * x) / m
        theta = theta - alpha * gradiente;
        JHistorico = CalcularCosto(x, y, theta)
    end
end
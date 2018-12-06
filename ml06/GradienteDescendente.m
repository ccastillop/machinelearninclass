function [theta, JHistorico] = GradienteDescendente(x, y, theta, alpha, num_iters)
    m = length(y);
    JHistorico = zeros(num_iters, 1);

    for iter = 1:num_iters
        h = FuncionSigmoidal( x * theta );
        grad = ( (h - y)' * x ) / m;
        theta = theta - alpha * grad';
        JHistorico(iter) = CalcularCosto(x, y, theta);
    end
end

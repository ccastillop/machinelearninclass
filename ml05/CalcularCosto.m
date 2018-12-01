function J = CalcularCosto(x, y, theta)
    m = length(y);
    h = FuncionSigmoidal(x * theta);
    errores = -y .* log(h) - (1-y) .* log(1-h);
    J = sum(errores)/m;
end

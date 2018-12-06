function J = CalcularCosto(x, y, theta)
	m = length(y);
    
    h = FuncionSigmoidal( x * theta);
    
    errors = -y.*log(h) - (1-y).*log(1-h);
    
    J = sum(errors)/m;
end

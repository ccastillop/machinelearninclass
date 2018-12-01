function p = PredecirClase(theta, x)
    p = FuncionSigmoidal(x*theta) > 0.5;
end
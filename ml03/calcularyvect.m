function y = calcularyvect(x)
    t = [2.15 8]';
    xt = [ ones(length(x),1) x];
    y = xt * t;
end

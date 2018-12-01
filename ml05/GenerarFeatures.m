function xx = GenerarFeatures(x1, x2)
    m = length(x1);
    xx = [ones(m,1) x1  x2  x1.*x2  x1.^2  x2.^2 (x1.^2).*x2  x1.*(x2.^2)];
end


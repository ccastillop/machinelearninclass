function J = CalculaCosto(x, y, theta)
    m = length(y);
    J = sum( (x * theta - y) .^2 ) / (2*m);
end
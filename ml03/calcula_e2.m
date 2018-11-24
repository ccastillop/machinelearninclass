function j = calcula_j(x,y)
    xa = [ones(5,1) x] ;
    t = [4.16 7.9]' ;
    h = xa * t ;
    w = ones(1,5)*(h-y);
    m = length(xa);
    j = (1 / (2 * m)) * (w' * w);
end
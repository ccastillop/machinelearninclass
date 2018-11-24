function e = calcula_e2(x,y)
    xa = [ones(5,1) x] ;
    t = [4.16 7.9]' ;
    h = xa * t ;
    e = ones(1,5)*(h-y);
end
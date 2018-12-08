function codigo = IngreseCodigo()
    entrada = input('\nIngrese el nùmero de expediente:', 's');
    [codigo, exito] = str2num(entrada);
    if exito == 0 
        fprintf('\nEl texto ingresado no es un número\n');
    end
end
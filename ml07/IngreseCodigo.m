function codigo = IngreseCodigo()
    entrada = input('\nIngrese el n�mero de expediente:', 's');
    [codigo, exito] = str2num(entrada);
    if exito == 0 
        fprintf('\nEl texto ingresado no es un n�mero\n');
    end
end
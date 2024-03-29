function RLMV()
    %cleanup
    clear;
    close all;
    clc;
    
    %data
    data = load('data.txt');
    x = data(:, 1:4 );
    y = data(:, 5);
    m = length(y);
    
    fprintf('Las primeras tres filas de datos son: \n');
    fprintf('x = [%.0f %.0f %.0f %.0f], y = %.0f \n', [x(1:3,:) y(1:3,:)]');
    
    %normalizaciones y unos
    [XNormalizado, mu, sigma] = Normalizar(x);
    XNormalizado = [ones(m,1) XNormalizado];
    
    %calculando gradiente
    alpha = 0.01;
    iteraciones = 500;
    theta = zeros(5, 1);
    [theta ,JHistorico] = GradienteDescendente(XNormalizado, y, theta, alpha, iteraciones);
    
    %ploteando
    figure;
    plot(1:numel(JHistorico), JHistorico, '-b', 'LineWidth', 2);
    
    % calculo carretera
    fprintf('Parámetros calculados (theta): \n');
    fprintf('%f \n\n', theta);
    
    fprintf('El costo para la carretera es: ');
    NuevoX = [1 2800 500 2 130];
    NuevoXNormalizado = (NuevoX - [0 mu])./[1 sigma];
    costo = NuevoXNormalizado * theta;
    fprintf('%f \n', costo);
end
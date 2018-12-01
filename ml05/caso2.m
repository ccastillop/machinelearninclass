clear;
close all;
clc;

data = load('enfermos.txt');
x = data(:,1:2);
y = data(:,3);

GraficarClases(x, y);
hold on;
xlabel('Test 1');
ylabel('Test 2');
legend('Enfermo', 'Sano');
hold off;
%pause;

xx = GenerarFeatures(x(:,1), x(:,2));
theta = zeros(size(xx,2),1);
[theta, J] = GradienteDescendente(xx, y, theta, 0.2, 10000);

figure;
hold on;
plot(1:length(J), J);
xlabel('Iteraciones');
ylabel('Costo');
title('Costo por iteración');
hold off;

%mostrar limite del predictor
GraficarClases(x,y);
hold on;
u = linspace(-1, 1.5, 50);
v = linspace(-1, 1.5, 50);
z = zeros(length(u), length(v));

for i=1:length(u)
    for j=1:length(v)
        z(i,j) = GenerarFeatures(u(i), v(j))*theta;
    end
end

z = z';
contour(u, v, z, [0,0], 'LineWidth', 2);
title('Límite del predictor');
xlabel('Test 1');
ylabel('Test 2');
legend('Enfermo', 'Sano', 'Límite de decisión');
hold off;

prueba = [1 0.85 0.4];
pruebaxx = GenerarFeatures(prueba(:,2), prueba(:,3));

probabilidad = FuncionSigmoidal(pruebaxx * theta) * 100;
fprintf('Un paciente con 0.85 de Test A y 0.4 test B tiene una prob de %f%% de estar enfermo', probabilidad);
fprintf('\nClase %d (0:Sano, 1:Enfermo) \n', PredecirClase(theta, pruebaxx));

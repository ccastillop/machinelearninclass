clear;
clc;
close all;

data = load('fallasmotores.txt');
x = data(:,1:2);
y = data(:,3);

GraficarClases(x,y);
hold on;
xlabel('Resultado prueba A');
ylabel('Resultado prueba B');
legend('Tienen falla interna', 'No tiene falla interna');
hold off;
%pause;

[m, n] = size(x);
x = [ones(m,1) x];

theta = zeros(n+1, 1);
[theta, JHistorico] = GradienteDescendente(x,y,theta,0.001,100000);

figure;
hold on;
plot(1:length(JHistorico), JHistorico);
xlabel('Iteraciones');
ylabel('Costo');
hold off;

GraficarClases(x(:,2:3),y);
hold on;

plotx = [min(x(:,2))-1, max(x(:,2))+2];
ploty = (-1./theta(3)).*(theta(2).*plotx + theta(1));
plot(plotx, ploty);
axis([30, 100, 30, 100]);
xlabel('Resultado prueba A');
ylabel('Resultado prueba B');
legend('Tienen falla interna', 'No tiene falla interna');
hold off;

%es buena la predicción?
p = PredecirClase(theta, x);
fprintf('Precisión del clasificador = %f%%', mean(double(p==y))*100);

%predecir
prueba = [1 53 89]
probabilidad = FuncionSigmoidal(prueba * theta) * 100;
fprintf('Un motor con 53 en la prueba A y 89 en la B tiene prob. de falla de: %f%%', probabilidad);
fprintf('\nEl predictor indica que pertenece a la clase %d (0:sin falla, 1:con falla) \n', ...
    PredecirClase(theta, prueba));



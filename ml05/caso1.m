clear;
;
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
pause;



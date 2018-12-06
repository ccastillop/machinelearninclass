imagen = imread('c:\ml\ml06\test20x20_9.jpg');
imshow(imagen);
x = reshape(double(imagen), 1, 400);
x = [1 x];

load('thetas.mat');
pred = FuncionSigmoidal(x * thetas);
[u, p] = max(pred, [], 2);
fprintf('La clase detectada es: %d con %f%% de probabilidad', p, u);


clear;
clc;
close all;

load('digitos.mat');
tic;
%hiddenSizes capas
FFN = feedforwardnet([40 40 10]);
%entrenando, X vector columna, Y vector Fila
NetFF = train(FFN, x', y');

pred = NetFF(x');

mean(round(pred) == y')
toc;
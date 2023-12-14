clear,clc,close all

addpath('utils')

% declaracao da variavel VMs que representa as máquinas virtuais
% portanto possui os valores numéricos de demandas e preços
VMs = [50 40 60 30 75;10 8 12 6 15];

% variável que representa os dois servidores e suas capacidades de
% armazenamento
C = [30,25];

[melhorSolucao,melhorLucro] = busca_exaustiva(VMs,C);

disp('Melhor solução: ');
[i, j] = find(melhorSolucao);  % Encontrar índices onde melhorSolucao é 1
for k = 1:length(i)
    fprintf('\nMáquina virtual %i alocada no servidor %i\n', i(k), j(k));
end
fprintf('\nLucro: \n');
disp(melhorLucro);
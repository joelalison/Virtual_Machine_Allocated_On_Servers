clear,clc,close all

%% declarando dos valores numéricos

% preço das máquinas virtuais
precos = [50 40 60 30 75];

% demanda das máquinas virtuais
DM = [10 8 12 6 15];
num_vms = length(DM);

% capacidade dos servidores
C = [30 25];
num_servidores = length(C);

melhor_solucao = [];
melhor_lucro = 0;

combinacoes = dec2bin(0:2^(num_vms*num_servidores)-1) - '0';
soma = 0;
lucro = 0;

%%
melhorLucro = 0;
melhorAlocacoes = zeros(num_vms,num_servidores);
for i=1:size(combinacoes,1)
    % representa a alocação da máquina virtual i (linha) por servidor j (coluna)
    alocacoes = reshape(combinacoes(i, :), num_vms, num_servidores);
    for m=1:2
        for k=1:5
            soma = soma + DM(k)*alocacoes(k,m);
        end
        if soma <= C(m)
                lucro = lucro + sum(alocacoes(:,m).*precos(:));
        end
        soma = 0;
    end
    lucroTotal = sum(lucro);
    if lucroTotal >= melhorLucro
        melhorLucro = lucroTotal;
        melhorAlocacoes = alocacoes;
    end
    lucro = 0;
end

disp('Melhor solução: ')
for j=1:2
    for i=1:5
        if melhorAlocacoes(i,j) == 1
            fprintf('\nMáquina virtual %i alocada no servidor %i\n',i,j)
        end
    end
end
fprintf('\n')
disp('Lucro: ')
disp(melhorLucro)

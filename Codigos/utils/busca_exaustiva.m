function [melhor_solucao, melhor_lucro] = busca_exaustiva(varargin)

    % preço das máquinas virtuais
    precos = varargin{1}(1,:);
    
    % demanda das máquinas virtuais
    DM = varargin{1}(2,:);
    num_vms = length(DM);
    
    % capacidade dos servidores
    C = varargin{2};
    num_servidores = length(C);
    
    % todas as combinações possíveis de soluções binárias para a variável
    % xij
    combinacoes = dec2bin(0:2^(num_vms*num_servidores)-1) - '0';
    soma = 0;
    lucro = 0;
    
    melhor_lucro = 0;
    melhor_solucao = zeros(num_vms,num_servidores);
    for i=1:size(combinacoes,1)
        % representa a alocação da máquina virtual i (linha) por servidor j (coluna)
        alocacoes = reshape(combinacoes(i, :), num_vms, num_servidores);
        for m=1:2
            soma = sum(DM .* alocacoes(:, m)');
            if soma <= C(m)
                    lucro = lucro + sum(alocacoes(:,m).*precos(:));
            end
        end
        lucroTotal = sum(lucro);
        if lucroTotal >= melhor_lucro
            melhor_lucro = lucroTotal;
            melhor_solucao = alocacoes;
        end
        lucro = 0;
    end
end

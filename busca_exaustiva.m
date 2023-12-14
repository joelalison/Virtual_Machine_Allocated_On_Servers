function [melhor_solucao, melhor_lucro] = busca_exaustiva(vm_precos, vm_demandas, servidor_capacidades)
    num_vms = length(vm_precos);
    num_servidores = length(servidor_capacidades);

    melhor_solucao = [];
    melhor_lucro = 0;

    combinacoes = dec2bin(0:2^(num_vms*num_servidores)-1) - '0';

    for k = 1:size(combinacoes, 1)
        % Reshape a combinação em uma matriz que representa as alocações
        alocacoes = reshape(combinacoes(k, :), num_vms, num_servidores);

        % Verifica as restrições para cada servidor
        restricoes_atendidas = all(sum(alocacoes(:, j) .* vm_demandas') <= servidor_capacidades(j) for j = 1:num_servidores);

        if restricoes_atendidas
            % Calcula o lucro total da alocação
            lucro_total = sum(sum(alocacoes .* vm_precos));

            % Atualiza a melhor solução se o lucro for maior que o da
            % solução anterior
            if lucro_total > melhor_lucro
                melhor_lucro = lucro_total;
                melhor_solucao = alocacoes;
            end
        end
    end
end

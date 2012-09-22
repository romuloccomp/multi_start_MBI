%MBI
%Entradas
%   populacao: indivíduos da população
%   N: número de indivíduos da população
%   taxa_renovacao: taxa de natalidade/mortalidade
%   taxa_infeccao: taxa de dispersão da doença por indivíduo
%   taxa_recuperacao: taxa com que indivíduos se recuperam da doença
%Saídas
%   populacao: vetor de indivíduos após o presente estado

function [ populacao, n_infeccoes ] = mbi( populacao , N , taxa_renovacao , taxa_infeccao , taxa_recuperacao )
    for i=1:N
        %renovação
        if rand(1,1) <= taxa_renovacao
            populacao(i) = 0;
        
        %contaminação
        elseif populacao(i) == 1
            for j=1:N
                if populacao(j)==0
                    if rand(1,1) <= taxa_infeccao
                        populacao(j) = 1;
                    end
                end
            end
                    
            %recuperacao
            if rand(1,1) <= taxa_recuperacao
                populacao(i) = 2;
            end
        end
    end
end
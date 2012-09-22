%MBI
%Entradas
%   populacao: indiv�duos da popula��o
%   N: n�mero de indiv�duos da popula��o
%   taxa_renovacao: taxa de natalidade/mortalidade
%   taxa_infeccao: taxa de dispers�o da doen�a por indiv�duo
%   taxa_recuperacao: taxa com que indiv�duos se recuperam da doen�a
%Sa�das
%   populacao: vetor de indiv�duos ap�s o presente estado

function [ populacao, n_infeccoes ] = mbi( populacao , N , taxa_renovacao , taxa_infeccao , taxa_recuperacao )
    for i=1:N
        %renova��o
        if rand(1,1) <= taxa_renovacao
            populacao(i) = 0;
        
        %contamina��o
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
function  [total_vacinados , total_infectados, contadores] = exec_mbi( taxas )
%function [ prob_erradicacao , total_vacinados , total_infectados] = exec_mbi( taxas )
    %exec_mbi
    %Entrada
    %   taxas: vetor contendo as taxas de vacina��o
    %Sa�das
    %   prob_erradicacao: probabilidade de erradica��o da doen�a
    %   n_vacinados:
    %   total_infectados: media do total de infectados nas itera��es

    %clc; 
    a = clock
    
    if nargin < 1
        taxas = 0;
    end
    
    parametros();
        
    %Carrega os par�metros de arquivo
    
    for i=1:n_iter
        %Aloca mem�ria para popula��o e para os contadores,
        %gera popula��o inicial e
        %gera estado inicial dos contadores
        estado_inicial();
        for p=t_inicial:n_passos
           
            %Mbi
            [populacao] = mbi(populacao , N , taxa_renovacao , taxa_infeccao , taxa_recuperacao);
            %Vacinacao
            if mod(p,t_vacinacao) == t_vacinacao/2
                for k=1:N %percorre toda populacao
                    if populacao(k) == 0; %se eh suscetivel
                        if rand(1,1) <= taxas(aux) %se gera numero menor que a taxa de vacinacao
                            populacao(k) = 2; %vacinado = recuperado
                            n_vacinados = n_vacinados+1; %incrementa numero de vacinados
                        end
                    end
                end
                aux = aux+1;
            end
            
            %Conta os individuos a cada iteracao
            conta_individuos();
            
            %Soma, a cada itera��o, o n�mero de infectados para retorno
            n_infectados = n_infectados + contadores(2,p);
        end
        
        %Se erradicou a doen�a, ou seja, restou menos de 0.5% de infectados
        %if contadores(2,n_passos) <= N*0.005;
        %    erradicou = erradicou + 1;
        %end
        
        %Se deseja plotar gr�fico da popula��o x tempo
        %plota(contadores,n_passos);
        
    end
    
    %Faz a m�dia do custo com vacinados e infectados para retorno
    %C�lcula ent�o, a probabilidade de erradica��o da doen�a
    %total_vacinados  = round(n_vacinados/n_iter);
    %total_infectados = round(n_infectados/n_iter);
    %prob_erradicacao = erradicou/n_iter;
    
    total_vacinados  = n_vacinados;
    total_infectados = n_infectados;
end


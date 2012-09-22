     %Lista de parâmetros do programa

    %Parâmetros do mult-start
    n_vascinas      = 800;                      %Numero total de vacina disponiveis no periodo
    n_anos          = 10;                        %Quantidade de anos x 360 dias
    alfa_vacina     = 1;                       %Peso alfa para numero de vacinas
    alfa_infectado  = 1;                        %Peso alfa para numero de infectado


    %Parâmetros da doença
    N                   = 5000;                 %Tamanho da população
    mi                  = 1.0/70.0;             %Taxa de nascimento/mortalidade
    beta                = 2.218246;                 %Taxa de infecção
    gama                = 1.0/24.0;             %Taxa de recuperação
    perc_inf_iniciais   = 0.01;                 %Percentagem inicial de infectados
    
    %Parâmetros do programa
    t_inicial       = 2;                        %Tempo inicial da execução
    t_final         = 360 * n_anos;             %Tempo final da execução
    deltat          = 1;                        %Intevalo/Passo em dias
    n_passos        = (t_final/deltat);         %Número total de passos
    n_inf_iniciais  = perc_inf_iniciais*N;      %Número inicial de infectados
    erradicou       = 0;                        %Auxiliar para erradicação
    n_iter          = 1;                        %Número de iterações
    aux             = 1;                        %Auxiliar para vacinação
    n_infectados    = 0;                        %Numero de infectados
    
    %Calculo das taxas
    taxa_renovacao      = mi*deltat;            %Taxa de renovação
    taxa_infeccao       = (beta*deltat)/(N-1);  %Taxa de infecção
    taxa_recuperacao    = gama*deltat;          %Taxa de recuperação
    
    %Parâmetros da vacinação
    n_vacinacoes    = numel(taxas);             %Número de pulsos
    t_vacinacao     = n_passos/n_vacinacoes;    %Determinação do tempo de vacinação
    n_vacinados     = 0;                        %Número de vacinados

    n_taxas         = round(t_final/30);       %Tamanho do vetor de taxas

    beta1 = beta;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Exemplos:    
%Doença que erradica
%(s0, i0)  = (2.0000e-001, 8.000000e-001) 
%Gamma:  1.500000e-001
%Mu:     1.000000e-001 
%Beta:   1.750000e-001 
%R0:     7.000000e-001    

%Doença que não erradica
%(s0, i0)    = (6.0000e-001, 1.000000e-002) 
%Gamma:  1.500000e-001 
%Mu:     1.000000e-001 
%Beta:   2.218246e+000 
%R0:     8.872983e+000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
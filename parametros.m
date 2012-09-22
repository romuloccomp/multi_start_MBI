     %Lista de par�metros do programa

    %Par�metros do mult-start
    n_vascinas      = 800;                      %Numero total de vacina disponiveis no periodo
    n_anos          = 10;                        %Quantidade de anos x 360 dias
    alfa_vacina     = 1;                       %Peso alfa para numero de vacinas
    alfa_infectado  = 1;                        %Peso alfa para numero de infectado


    %Par�metros da doen�a
    N                   = 5000;                 %Tamanho da popula��o
    mi                  = 1.0/70.0;             %Taxa de nascimento/mortalidade
    beta                = 2.218246;                 %Taxa de infec��o
    gama                = 1.0/24.0;             %Taxa de recupera��o
    perc_inf_iniciais   = 0.01;                 %Percentagem inicial de infectados
    
    %Par�metros do programa
    t_inicial       = 2;                        %Tempo inicial da execu��o
    t_final         = 360 * n_anos;             %Tempo final da execu��o
    deltat          = 1;                        %Intevalo/Passo em dias
    n_passos        = (t_final/deltat);         %N�mero total de passos
    n_inf_iniciais  = perc_inf_iniciais*N;      %N�mero inicial de infectados
    erradicou       = 0;                        %Auxiliar para erradica��o
    n_iter          = 1;                        %N�mero de itera��es
    aux             = 1;                        %Auxiliar para vacina��o
    n_infectados    = 0;                        %Numero de infectados
    
    %Calculo das taxas
    taxa_renovacao      = mi*deltat;            %Taxa de renova��o
    taxa_infeccao       = (beta*deltat)/(N-1);  %Taxa de infec��o
    taxa_recuperacao    = gama*deltat;          %Taxa de recupera��o
    
    %Par�metros da vacina��o
    n_vacinacoes    = numel(taxas);             %N�mero de pulsos
    t_vacinacao     = n_passos/n_vacinacoes;    %Determina��o do tempo de vacina��o
    n_vacinados     = 0;                        %N�mero de vacinados

    n_taxas         = round(t_final/30);       %Tamanho do vetor de taxas

    beta1 = beta;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Exemplos:    
%Doen�a que erradica
%(s0, i0)  = (2.0000e-001, 8.000000e-001) 
%Gamma:  1.500000e-001
%Mu:     1.000000e-001 
%Beta:   1.750000e-001 
%R0:     7.000000e-001    

%Doen�a que n�o erradica
%(s0, i0)    = (6.0000e-001, 1.000000e-002) 
%Gamma:  1.500000e-001 
%Mu:     1.000000e-001 
%Beta:   2.218246e+000 
%R0:     8.872983e+000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
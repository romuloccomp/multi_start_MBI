%Vari�veis que precisam ter seus valores setados � cada itera��o

%Aloca mem�ria para popula��o e para os contadores
populacao(1:N) = 0;
contadores(1:3,1:n_passos) = 0;

%Gera popula��o inicial
populacao(1:n_inf_iniciais) = 1;
populacao(n_inf_iniciais+1:N) = 0;
        
%Gera estado inicial dos contadores
contadores(2,1) = n_inf_iniciais;       %N�mero de infectados
contadores(1,1) = N - contadores(2,1);  %N�mero de suscet�veis
contadores(3,1) = 0;                    %N�mero de recuperados

%Demais vari�veis
n_vacinados = 0;                %contador de indiv�duos vacinados
aux=1;                          %auxiliar para vacina��o
n_infectados = n_inf_iniciais;  %n�mero de infectados em cada itera��o
total_infectados = 0;           %total de infectados no fim das itera��es
total_vacinados = 0;            %total de vacinados no fim das itera��es
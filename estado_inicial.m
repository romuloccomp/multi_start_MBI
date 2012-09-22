%Variáveis que precisam ter seus valores setados à cada iteração

%Aloca memória para população e para os contadores
populacao(1:N) = 0;
contadores(1:3,1:n_passos) = 0;

%Gera população inicial
populacao(1:n_inf_iniciais) = 1;
populacao(n_inf_iniciais+1:N) = 0;
        
%Gera estado inicial dos contadores
contadores(2,1) = n_inf_iniciais;       %Número de infectados
contadores(1,1) = N - contadores(2,1);  %Número de suscetíveis
contadores(3,1) = 0;                    %Número de recuperados

%Demais variáveis
n_vacinados = 0;                %contador de indivíduos vacinados
aux=1;                          %auxiliar para vacinação
n_infectados = n_inf_iniciais;  %número de infectados em cada iteração
total_infectados = 0;           %total de infectados no fim das iterações
total_vacinados = 0;            %total de vacinados no fim das iterações
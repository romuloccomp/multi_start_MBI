plot(Svacinas_melhor)
title('Itera��es do MBI');
xlabel('Tempo dias');
ylabel('Vacinas');


Doen�a que erradica
1e
    alfa_vacina     = 1;                       %Peso alfa para numero de vacinas
    alfa_infectado  = 10;                        %Peso alfa para numero de infectado
    Beta:   0.05
2e   
    alfa_vacina     = 10;                       %Peso alfa para numero de vacinas
    alfa_infectado  = 1;                        %Peso alfa para numero de infectado
    Beta:   0.05

    
 Doen�a que nao erradicao   
1n   
    alfa_vacina     = 1;                       %Peso alfa para numero de vacinas
    alfa_infectado  = 10;                        %Peso alfa para numero de infectado
    Beta:   0.95
    
2n   
    alfa_vacina     = 10;                       %Peso alfa para numero de vacinas
    alfa_infectado  = 1;                        %Peso alfa para numero de infectado
    Beta:   0.95

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
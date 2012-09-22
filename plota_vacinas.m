function [] = plota_vacinas( dist , n_passos )
    
    hold on;
    grid on;
    
    plot(dist(1:n_passos),'b-');

    title('Distribuição de Vacinas');
    xlabel('Mês');
    ylabel('Vacinas');
    %legend('Suscetíveis','Infectados','Recuperados');
    
end
function [] = plota_vacinas( dist , n_passos )
    
    hold on;
    grid on;
    
    plot(dist(1:n_passos),'b-');

    title('Distribui��o de Vacinas');
    xlabel('M�s');
    ylabel('Vacinas');
    %legend('Suscet�veis','Infectados','Recuperados');
    
end
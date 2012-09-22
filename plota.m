function [] = plota( res , n_passos )
    
    hold on;
    grid on;
    plot(res(1,1:n_passos),'g-');
    plot(res(2,1:n_passos),'r-');
    plot(res(3,1:n_passos),'b-');

    title('Iterações do MBI');
    xlabel('Tempo');
    ylabel('População');
    legend('Suscetíveis','Infectados','Recuperados');
    
end
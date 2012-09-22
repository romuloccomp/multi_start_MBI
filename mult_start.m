
function [Staxas_melhor,Svacinas_melhor,Ssum_melhor, Sconta_melhor] = mult_start()

    taxas = 0;
    parametros();
    
    Staxas   = [];
    Svacinas = [];
    Ssum     = 0;
    Sconta   = [];
    
    Staxas_melhor   = [];
    Svacinas_melhor = [];
    Ssum_melhor     = -1;
    Sconta_melhor   = [];
    
    
    fprintf('alfa_vacina: %d\n',alfa_vacina);
    fprintf('alfa_infectado: %d\n',alfa_infectado);
    fprintf('Beta: %i \n',beta1);
    fprintf('RO: %i \n',beta1/(gama+mi));
    
    for i=1:1
        %fprintf('criaTaxasRand\n');
        [Staxas,Svacinas] = criaTaxasRand(12,n_vascinas,N);

        [total_vacinados, total_infectados, Sconta] = exec_mbi( Staxas );

        Ssum =  fo(total_vacinados, total_infectados);
        
        [Staxas,Svacinas,Ssum,Sconta] = descidaPrimeiraMelhora(Staxas,Svacinas,Ssum,Sconta,N);
        
        if ((Ssum_melhor > Ssum) || (Ssum_melhor == -1))
            Staxas_melhor   = Staxas;
            Svacinas_melhor = Svacinas;
            Ssum_melhor     = Ssum;
            Sconta_melhor   = Sconta;
        end
    end
    
    b = clock

end

function [result] = fo (total_vacinados,total_infectados)
    taxas = 0;
    parametros();
    result = (alfa_vacina * total_vacinados) + (alfa_infectado * total_infectados);
end


function [Staxas,Svacinas,Ssum, Sconta] = descidaPrimeiraMelhora(Staxas,Svacinas,Ssum,Sconta,N)
    
    Staxas_l    = Staxas;
    Svacinas_l  = Svacinas;
    Ssum_l      = Ssum;
    cont        = numel(Svacinas) * 2;
    
    while ((Ssum < Ssum_l)&&(cont>0))
        op = rand_int(1,2);
        if(op == 1)
            [Staxas_l,Svacinas_l] = vizinhoTroca(Staxas_l,Svacinas_l);
        else
            [Staxas_l,Svacinas_l] = vizinhoInsere(Staxas_l,Svacinas_l,N);
        end

        %[total_vacinados, total_infectados] = exec_mbi( Staxas_l );
        [total_vacinados, total_infectados, Sconta_l] = exec_mbi( Staxas_l );
         
        Ssum_l = fo(total_vacinados, total_infectados);
        cont = cont -1;
    end
    
    if(Ssum > Ssum_l)
        Staxas   = Staxas_l ;
        Svacinas = Svacinas_l  ;
        Ssum     = Ssum_l;
        Sconta   = Sconta_l;
    end
    
end

function [Staxas,Svacinas] = vizinhoTroca(Staxas,Svacinas)
    
    i   = rand_int(1,numel(Svacinas) - 1);
    j   = rand_int(1,numel(Svacinas) - 1);
    aux         = Svacinas(i);
    Svacinas(i) = Svacinas(j);
    Svacinas(j) = aux;
    
    aux         = Staxas(i);
    Staxas(i) = Staxas(j);
    Staxas(j) = aux;
    
end

function [Staxas,Svacinas] = vizinhoInsere(Staxas,Svacinas,N)
    
    i   = rand_int(1,numel(Svacinas) - 1);
    j   = rand_int(1,numel(Svacinas) - 1);
    

    Svacinas(i) = Svacinas(i) - 1;
    Svacinas(j) = Svacinas(j) + 1;

    Staxas(i)   = calculaTaxaVascinacao(Svacinas(i),N);
    Staxas(j)   = calculaTaxaVascinacao(Svacinas(j),N);
    
end



function [Staxas,Svacinas] = criaTaxasRand(num,n_vascinas,N)
    
    num_vacina_aux  = n_vascinas;
        
    x = rand_int(1,num -1); %sorteia a possição
    Staxas = nulls(num); %set taxas em -1
    
    for i=1:num
        
        while Staxas(x) ~= -1
            x = rand_int(1,num -1);
        end

        %Com numero maximo de vacinas disponiveis   
        num_taxa_aux   = rand_int(0,num_vacina_aux);
        Svacinas(x)    = num_taxa_aux;
        Staxas(x)      = calculaTaxaVascinacao(num_taxa_aux,N);
        num_vacina_aux = num_vacina_aux - num_taxa_aux;
        %fprintf('%i %i, ',num_taxa_aux,taxas(j));
    end
end


function [x] = nulls(n)
    for i = 1:n, x(i) = -1; end
end

function [taxa] = calculaTaxaVascinacao(num_vacina_aux,N)
	taxa = num_vacina_aux / N;
end


function [ x ] = rand_int( a,b )
	x = a + round(b*rand);
end

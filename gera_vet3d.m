function [ vet3d ] = gera_vet3d( data )

    %O algoritimo inverte os dados carregados e chama a funcao exec_mbi
    %para cada linha da variavel data que � cada vetor de vacina��o.

    
    
    
    
    %Para gerar o grafico a partir do arquivo.dat
    %Considerando os dados carregados de um arquivo com os vetores de
    %vacina��o colocados nas colunas.
    
        %Caso deseja-se gerar a partir de determinadas duas linhas
        %Deve-se atribuir o valor das colunas (no data.dat) �s seguintes vari�veis
        
        
            %data = data';
            %n_col_vet1 = 0;
            %n_col_vet2 = 0;
            %vet3d = zeros(3,2);
            %taxas = data(n_col_vet1,:);
            %[ vet3d(1,1) , vet3d(2,1) , vet3d(3,1) ] = exec_mbi( taxas );
            %taxas = data(n_col_vet2,:);
            %[ vet3d(1,2) , vet3d(2,2) , vet3d(3,2) ] = exec_mbi( taxas );
    
 
        %Caso deseja-se gerar o gr�fico a partir de doto o arquivo .dat
        
            %data = data';
            %n_pontos = length(data);
            %vet3d = zeros(3,n_pontos);
            %for i=1:n_pontos
            %    taxas = data(i,:);
            %    [ vet3d(1,i) , vet3d(2,i) , vet3d(3,i) ] = exec_mbi( taxas );
            %end
        
        
        %Para gerar o vetor a partir de taxas aleat�rias
        
        
            numel = 100;
            linf = 0.6;
            taxas = zeros(numel,50);
            for i=1:numel
                for j=1:50
                    taxas(i,j) = rand(1,1)*(1-linf)+linf;
                end
            end
            vet3d = zeros(3,numel);
            for i=1:numel
                [ vet3d(1,i) , vet3d(2,i) , vet3d(3,i) ] = exec_mbi( taxas(i,:) );
            end
        
    
end
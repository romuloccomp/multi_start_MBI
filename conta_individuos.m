%conta os individuos a cada passo
for k=1:N
    if populacao(k) == 0
        contadores(1,p) = contadores(1,p)+1;
    elseif populacao(k) == 1
        contadores(2,p) = contadores(2,p)+1;
    elseif populacao(k) == 2
        contadores(3,p) = contadores(3,p)+1;
    end
end
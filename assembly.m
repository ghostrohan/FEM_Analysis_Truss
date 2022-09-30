%% Assembly of elemental matrices 
function GK = assembly(G,C,m,n)
GK = zeros(2*m);
for i = 1:n;
    j = 4*(i-1) + 1;
    GK(C(i,1:4),C(i,1:4)) = GK(C(i,1:4),C(i,1:4)) + G(j:j+3,j:j+3);
end


    
    

function G = elestiff(E,A,F,n)

 G = zeros(n*4);
 
for i = 1:n
    j = 4*(i-1) + 1;
    %% Calculating parameters from element coordinates
    ln = sqrt((F(i,3)-F(i,1))^2+((F(i,4)-F(i,2))^2));
    l = (F(i,3)-F(i,1))/(ln);
    m =(F(i,4)-F(i,2))/(ln);
    L = [l m 0 0;0 0 l m];
    c = ((A*E)/ln);
    k = [ c -c ; -c c ];
    K = [L.']*[k]*[L];
    G(j:1:j+3,j:1:j+3) = G(j:1:j+3,j:1:j+3) + K;
    
end
end    


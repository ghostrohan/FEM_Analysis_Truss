function Stress = sigma(Disp,E,A,F,Alpha,DelT,C,n)
sigma = zeros(n,1);
for i = 1:n
    %% Calculating the transformation matrix L to convert global displacement to local
    %% All values calculated from element coordinates
    ln = sqrt((F(i,3)-F(i,1))^2+((F(i,4)-F(i,2))^2)); %% length of element
    l = (F(i,3)-F(i,1))/(ln); %% cosine
    m =(F(i,4)-F(i,2))/(ln);  %% sine
    L = [-l -m l m];
    sigma(i,1) = sigma(i,1) + (E/ln)*L*Disp(C(i,:),1) - (E*Alpha*DelT); 
    %% L*Dsip(C(i,:),1) gives change in length along local coordinates
end 
Stress = sigma;
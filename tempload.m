function Load_T = tempload(Load,E,A,F,n,m,Alpha,DelT,C)
LT = zeros(2*m,1);
for i = 1:n
    ln = sqrt((F(i,3)-F(i,1))^2+((F(i,4)-F(i,2))^2));
    l = (F(i,3)-F(i,1))/(ln);
    m =(F(i,4)-F(i,2))/(ln);
    c = (A*E*Alpha*DelT);
    Temp = c*[(-1)*l ; (-1)*m ; l ; m];
    LT(C(i,:),1) = LT(C(i,:),1) + Temp;
end
Load_T = LT + Load;
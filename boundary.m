function GKT = boundary(GK,BC,I,N,m,n)
Z = max(GK, [], 'all');
P = Z*10000;
%% Impose Boundary Condition Using Penalty Approach
for i = 1:2*m
    if BC(i,1)== 1;
        GK(i,i) = GK(i,i) + P;
     else 
        GK(i,i) = GK(i,i);
    end
end
%% Impose Inclined Boundary Condition
if N~=0
    T = zeros(2*m);
  for i = 1:N 
      CS = cos(I(i,2));
      SS = sin(I(i,2));
      BB = [P*(CS^2) P*(CS)*(-SS); P*(CS)*(-SS) P*(SS^2)];
    T((2*(I(i,1))-1):1:(2*(I(i,1))),(2*(I(i,1))-1):1:(2*(I(i,1)))) = T((2*(I(i,1))-1):1:(2*(I(i,1))),(2*(I(i,1))-1):1:(2*(I(i,1)))) + BB;
  end
  GKT = GK + T;
else 
    GKT = GK;
end
  
end
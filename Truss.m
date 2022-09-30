%% Entry of prelimnary Data
E = input('Enter the Modulus of Elasticiy');
A = input('Enter area of cross-section of members');
Alpha = input('Enter the Coefficient of Thermal Expansion');
DelT = input('Enter the change in temperature');
%% Entry of Structure Component Values
n = input('Enter number of elements');
m = input('Enter the number of nodes');
    for i = 1:n
    for k =1:4
       F(i,k) = input('Enter coordinates in sequence');
    end
    end
%% Loops for taking element DOFs for connectivity in sequence to co-ordinates taken
for i = 1:n
    fprintf('Enter DOFs for elenemt %i\n in same order as co-ordintaes',i);
    for j = 1:4
        C(i,j) = input('Enter DOFs for element in increasing order');
    end
end
%% Data for Load Vectors
for i = 1:2*m
    Load(i,1) = input('Enter load vector at DOF serially');
end
%% Complete Load Vector including Temperature Effects
Load_T = tempload(Load,E,A,F,n,m,Alpha,DelT,C);
%% Data for Boundary Conditions
%% If Contraint at node present and non-inclined support present enter 1 else 0
for i =  1:2*m
    BC(i,1) = input('If Contraint at node present and non-inclined in nature present enter 1 else 0');
end
%% Defining Inclined Rollers
N = input('Enter the number of inclined rollers');
if N~=0;
for i =  1:N
    I(i,1) = input('Enter the node number at inclined roller');
end 
for i = 1:N
    theta = input('Enter the angle of inclination of roller in degree');
     I(i,2) = (pi/180)*theta ;
end
else
    I = [];
end
%% Creation of Element Stiffness Matrix
G = elestiff(E,A,F,n);
%% Creation of Global Stiffness Matrix
GK = assembly(G,C,m,n);
%% Applying Boundary Conition and getting final Global Stiffness Matrix
GKT = boundary(GK,BC,I,N,m,n)
%% Getting Displacement
Disp = GKT \ Load_T
%% Getting Stresses
Stress = sigma(Disp,E,A,F,Alpha,DelT,C,n)



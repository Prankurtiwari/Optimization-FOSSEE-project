//Problem to test intlinprog
//Problem taken from Higher Engineering Mathematics by B.S.Grewal 43rd Edition 2015

//A firm making castings uses electric furnace to melt iron with the following : Carbon(min=3.2%,max=3.4%),Silicon(min=2.25%,max=2.35%)
//Specifications and costs of various raw materials used for this purpose are: Steel scrap(Carbon(0.4%),Silicon(0.15%),Cost(Rs.850/tonne)),Cast Iron Scrap(Carbon(3.8%),Silicon(2.4%),Cost(Rs. 900/tonne),Remelt from foundry(carbon(3.5%),Silicon(2.3%),Cost(Rs. 500/tonne))....If the total charge of iron metal required is 4 tonnes,find the weight in kg of each raw material that can be used in the optimal mix of minimum cost.

//CODE TO TEST THE FUNCTION
clc()
//FIrst,user is asked to enter number of variables(nbVar) and number of constraints(nbCon)
nbvar=input("Enter the number of variables")
mprintf("Enter the coefficient of the variables")
for i=1:nbvar
    c(i)=mscanf("%f");
end

//c=[0.85 0.9 0.5]';
nbcon=input("Enter the number of inequality constraint")

for i=1:nbcon
    mprintf("Enter the coefficient of the variables for %0.1f constraint",i)
    for j=1:nbvar
        A(i,j)=mscanf("%f")
    end
end

//A=[-0.4,-3.8,-3.5;0.4,3.8,3.5;-0.15,-2.41,-2.35;0.15,2.41,2.35];
mprintf("Enter the right side of the inequalities")
for i=1:nbcon
    b(i)=mscanf("%f")
end
//b=[128*100,136*10,90*100,94*100];
lb=repmat(0,1,3);
ub=[];
nbecon=input("Enter the number of equality constraint")
for i=1:nbecon
    mprintf("Enter the coefficient of the variables for %0.1f constraint",i)
    for j=1:nbvar
        A(i,j)=mscanf("%f")
    end
end
//Aeq = [1,1,1];
mprintf("Enter the right side of the equalities\n")
for i=1:nbecon
    beq(i)=mscanf("%f")
end
//beq=[40*100];
intcon = [1,2,3];
[x,f,status,output] = intlinprog(c',intcon,A,b,Aeq,beq,lb,ub)
mprintf("THE OPTIMAL VALUE OF Xs IS:")
disp(x);
mprintf("THE OPTIMAL VALUE OF OBJECTIVE FUNCTION AT THOSE X IS:")
disp(f);

//OUTPUT
//Enter the number of variables3
//Enter the coefficient of the variables
//-->0.85
//-->0.9
//-->0.5
//Enter the number of inequality constraint4
//Enter the coefficient of the variables for 1.0 constraint
//-->-0.4
//-->-3.8
//-->-3.5
//Enter the coefficient of the variables for 2.0 constraint
//-->0.4
//-->3.8
//-->3.5
//Enter the coefficient of the variables for 3.0 constraint
//-->-0.15
//-->-2.41
//-->-2.35
//Enter the coefficient of the variables for 4.0 constraint
//-->0.15
//-->2.41
//-->2.35
//Enter the right side of the inequalities
//-->12800
//-->13600
//-->9000
//-->9400
//Enter the number of equality constraint1
//Enter the coefficient of the variables for 1.0 constraint
//-->1
//-->1
//-->1
//Enter the right side of the equalities
//-->4000
 //THE OPTIMAL VALUE OF Xs IS:
   // 130.   
   // 0.     
   // 3870.  
 //THE OPTIMAL VALUE OF OBJECTIVE FUNCTION AT THOSE X IS:
   // 2045.5  
 

//Testing function quadprog
//Problem taken from Engineering Optimization b Singiresu S.Rao

//A manufacturing firm produces two products, A and B, using two limited resources. The maximum amounts of resources 1 and 2 available per day are 1000 and 250 units, respectively. the production of 1 unit of Product A requires 1 unit of resource and 0.2 unit of resource 2, and the production of 1 unit of product /b requires 0.5 unit of resource 1 and 0.5 unit of resource 2. The unit costs of resources 1 and 2 are given by the relations(0.375-0.00005u1) and (0.75-0.0001u2), respectively,  ui denotes the number of units of resource i used(i=1,2). the selling prices per unit of products A and B, pa and pb are given by
//pa=2.00-0.0005xa-0.00015xb
//pb=3.50-0.0002xa-0.0015xb

//where xa and xb indicate, respectively, the number of units of product A and B sold. Formulate the problem of maximisinng the profit assuming that the firm can sell the units it manufactures.

//Objective Function : F= -xb(3.5-0.0002xa-0.0015xb) subject to constraints
// xa-0.5xb<=1000
//0.2xa+0.5xb<=250
//xa>=0
//xb>=0
//CODE TO TEST quadprog FUNCTION
clc()
nbVar=input("Enter the  no. of variables")
nbCon=input("Enter the no. of constraints")
mprintf("Enter the  coefficients of non- linear variables in objective function");
for i=1:nbVar
    for j=1:nbCon
        H(i,j)=mscanf("%f")
end
end
mprintf("Enter the coefficients of linear coefficients\n")
for i=1:nbVar
    f(i)=mscanf("%f")
end
mprintf("Enter the coefficents of variables in constraints\n")
for i=1:nbVar
    for j=1:nbCon
        A(i,j)=mscanf("%f")
end
end
lb=[]
mprintf("Enter the values in constraints")
for i=1:nbCon
    conUB(i)=mscanf("%f")
end
conLB=[-%inf;-%inf]
ub=[]
[xopt,fopt,exitflag,output,lambda] = quadprog(nbVar,nbCon,H,f,lb,ub,A,conLB,conUB)
mprintf("The number of units of A and B respectively are:")
disp(xopt)
mprintf("\nThe profit maximised is:")
disp(fopt)

//OUTPUT

//Enter the  no. of variables2
//Enter the no. of constraints2
//Enter the  coefficients of non- linear variables in objective function
//-->0
//-->0.0004
//-->0.0004
//-->0.003
//Enter the coefficients of linear coefficients
//-->0
//-->-3.5
//Enter the coefficents of variables in constraints
//-->1
//-->0.5
//-->0.2
//-->0.5
//Enter the values in constraints
//-->1000
//-->250

//Optimal Solution Found.
 //The number of units of A and B respectively are:
//  - 312.5      
//    625.00001  
 //The profit maximised is:
//  - 1679.6875  


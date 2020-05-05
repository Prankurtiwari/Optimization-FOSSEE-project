//Program to test fsolve
//Problem taken from wikipedia/Lorenz system
//The model is a system of three ordinary differential equations now known as the Lorenz equations:
//dx/dt=sigma (y-x),dy/dt =x*(rho -z)-y , dz/dt=xy-beta*z

//The equations relate the properties of a two-dimensional fluid layer uniformly warmed from below and cooled from above. In particular, the equations describe the rate of change of three quantities with respect to time: x is proportional to the rate of convection.
//One normally assumes that the parameters sigma ,rho , and beta  are positive. Lorenz used the values sigma =10,beta =8/3 and rho =28. The system exhibits chaotic behavior for these (and nearby) values.

//CODE TO TEST THE FUNCTION

clc()
//Takes the number of variables
nbVar=input("Enter the  no. of variables")
//Asks the user to enter the lower bound variables in a vector
mprintf("Enter the LOWER BOUND\n");
for i=1:nbVar
       x0(i)=mscanf("%f")
end
//Objective function is defined
function y=fsol1(x)
  y(1)=x(1)-x(2)
  y(2)=2*x(1)-x(1)*x(3)-x(2)
  y(3)=x(1)*x(2)-3*x(3)
endfunction
//fsolve function of fosee toolbox is called
[xres,func,info]=fsolve(x0,fsol1);
disp(info)
//Value of info tells the optimality of the solution
if(info==1) then
    printf("OPTIMAL SOLUTION FOUND")
    disp(xres)
    printf("VALUE OF FUNCTION AT THOSE VALUES")
    disp(func)
else 
    printf("NO OPTIMAL SOLUTION FOUND")
end

//OUTPUT
//Enter the  no. of variables3
//Enter the LOWER BOUND
//-->100
//-->100
//-->100
 
//    1.  
//OPTIMAL SOLUTION FOUND 
//    1.7320508  
//    1.7320508  
//    1.         
//VALUE OF FUNCTION AT THOSE VALUES 
//    0.         
//  - 6.661D-16  
//    0. 




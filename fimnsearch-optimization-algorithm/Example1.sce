//Problem to test fminsearch
//Problem taken from Engineering Optimization b Singiresu S.Rao

//There are two frictionless rigid bodies A and B connected by three linear elastic springs having spring constants k1,k2 and k3. The springs are at their natural positions when the applied force P is zero. Find the displacements x1 and xx2 under the force P by using the principle of minimum potential energy.
//Potential energy=(1/2)*k3*(x(2)-x(1))^2 +(1/2)*k2*x(1)^2+(1/2)*k1*x(2)^2-P*x(2)

clc()
//Making the objective function to minimise potential energy
//CODE TO TEST THE FUNCTION
function y=f(x)
    t1=(1/2)*k3*(x(2)-x(1))^2
    t2=(1/2)*k2*x(1)^2
    t3=(1/2)*k1*x(2)^2
    t4=P*x(2)
    y=t1+t2+t3-t4
endfunction
//xo gives the initialised values
x0=[0,0]
//P is the force and taked as a constant here
P=input("Enter the value of force applied : ");
//k1,k2,k3 are the spring constants and are taken by the user 

k1=input("Enter the value of the spring constant ,k1 :")
k2=input("Enter the value of the spring constant ,k2 :")
k3=input("Enter the value of the spring constant ,k3 :")
//fminsearch function is called to get the output
[x,fval,exitflag,output] = fminsearch ( f , x0)
//The value of exitflag determines the optimality of the solution obtained and can be 1,0 or -1.The three cases are taken to display the output.
if exitflag == 0 then
    mprintf('Optimal Solution Found');
    printf("The two displacements x1 and x2 are:\n")
    disp(x)
    mprintf("The minimum potential energy is:")
    disp(fval)

elseif exitflag == 1 then
    mprintf('Maximum Number of Iterations Exceeded.\nOutput may not be optimal\n');
         printf("The two displacements x1 and x2 are:\n")
    disp(x)
    mprintf("The minimum potential energy is\n:")
    disp(fval)
else
    disp("Error encountered")
end

//OUTPUT:
//Enter the value of force applied : 100
//Enter the value of the spring constant ,k1 :1
//Enter the value of the spring constant ,k2 :2
//Enter the value of the spring constant ,k3 :1
//Maximum Number of Iterations Exceeded.
//Output may not be optimal
//The two displacements x1 and x2 are:
 
//    20.000045    60.000012  
//The minimum potential energy is
//: 
//  - 3000.  


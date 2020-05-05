//Problem to test fminbnd
//Problem taken from  Engineering Optimization b Singiresu S.Rao
//In a two stage compressor, the working gas leaving the first stage of compression is cooled(by passing in through a heat exchanger) before it enters the second stage of compression to increase the efficiency.  The total work input to a compressor(W) foran ideal gas, for isentropic compression, is given by 
//W=CpT[(p3/p1)^(k-1/k)+(p2/p1)^(k-1/k)-2]
//where Cp is the specific heat of the gas at constant pressure, k is the ratio of specific heat at the constant pressure to that at constant volume of the gas, and T is the temperature at which the gas enters the compressor. Find the pressure,P in the compressor.Also, determine the minimum work done on the compressor.

clc()
//the parameters needed are taken from the user
mprintf("Enter the value of specific heat at constant pressure Cp of the gas chosen\n");
C=mscanf("%f")
mprintf("Enter the temperature\n");
T1=mscanf("%f")
mprintf("Enter the ratio of Cp/Cv\n");
k=mscanf("%f")
//Objective function to be minimized
function y=f(x)
    y=C*T1*(((x(3)/x(1))^(k-1/k))-2+(x(2)/x(1))^(k-1/k))
endfunction
//Lower and upper bounds of the variables
x1=[10 10 10];
x2=[250 250 250];
//The function fminbnd is called with f,upper and lower bound vectors passed as arguements
[x,fval,output,lambda] =fminbnd(f, x1, x2)
//The value of exitflag determines the optimality of the solution obtained and can be 1,0 .The three cases are taken to display the output.
if exitflag == 0 then
    printf("The pressure values in  three cases in compressor are:\n")
    disp(x)
    mprintf("The minimum work done is:")
    disp(fval)

elseif exitflag == 1 then
    mprintf('Maximum Number of Iterations Exceeded.\nOutput may not be optimal\n');
         printf("The pressure values in three cases in compressor are:\n")
    disp(x)
    mprintf("The minimum work done is\n:")
    disp(fval)
else
    disp("Error encountered")
end
//OUTPUT
// Enter the value of specific heat at constant pressure Cp of the gas chosen
//-->23
//Enter the temperature
//-->123
//Enter the ratio of Cp/Cv
//-->4.5

//Optimal Solution Found.
//The pressure values in  three cases in compressor are:

//    154.27007  
//    10.015456  
//    10.015456  
//The minimum work done is: 
//  - 5657.953  
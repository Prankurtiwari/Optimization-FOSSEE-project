//Problem to test fminbnd
//Problem taken from  Engineering Optimization b Singiresu S.Rao
//A manufacturing firm producing small refrigerators has entered into a contract to supply 50 refrigerators at the end of the first month, 50 at the end of the second month, and 50 at the end of the third. The cost of producing x refrigators in any month is given by $(x^2 + 1000).The firm can produce more refrigerators in any month and carry them to a subsequent month. However,it costs $20 perunit for any refrigerator carried over from one month to the next. Assumiing that there is no initial inventory, determine the number of refrigerators to be produced in each month to minimize the total  cost.

clc()
//Objective function to be minimised
function y=f(x)
y=(x(1)^2)+(x(2)^2)+(x(3)^2)+(40*x(1))+(20*x(2))
endfunction

//Variable bounds
//x1 forms the lower bound and x2 is the vector forming the upper bound of the variables.
x1 = [50 50 50];
x2 = [];
//Calling Ipopt
[x,fval,exitflag,output,lambda] =fminbnd(f, x1, x2)
//The value of exitflag determines the optimality of the solution obtained and can be 1,0 .The three cases are taken to display the output.
if exitflag == 0 then
    printf("The number of units of refrigerators are:\n")
    disp(x)
    mprintf("The total cost is:")
    disp(fval)

elseif exitflag == 1 then
    mprintf('Maximum Number of Iterations Exceeded.\nOutput may not be optimal\n');
         printf("The number of units of refrigerators are:\n")
    disp(x)
    mprintf("The total cost is\n:")
    disp(fval)
else
    disp("Error encountered")
end

//OUTPUT 
//Optimal Solution Found.
//The number of units of refrigerators are:
//    50.  
//    50.  
//    50.  
//The total cost is: 
//    10500.

% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.


function gradF = ComputeGradient(x,mu)
x1=x(1,1);
x2=x(1,2);

if x1^2 + x2^2 - 1>0
    gradF=[2*x1-2-4*mu*x1+4*mu*x2^2*x1+4*mu*x1^3 4*x2-8-4*mu*x2+4*mu*x1^2*x2+4*mu*x2^3];
else
    gradF=[2*x1-2 4*x2-8];









end
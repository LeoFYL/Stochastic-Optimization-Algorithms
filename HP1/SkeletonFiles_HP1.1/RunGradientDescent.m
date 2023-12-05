% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)

x = xStart;
gradF = ComputeGradient(x,mu);
while abs(gradF)>gradientTolerance
    d0=gradF;
     
     xnext=x-eta*d0;
     %disp(gradF)
     

     
     gradF=ComputeGradient(xnext,mu);
    
     x=xnext;
end







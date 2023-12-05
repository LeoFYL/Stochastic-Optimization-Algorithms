% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x)
   
    x1 = x(1);
    x2 = x(2);
    g = (1.5 - x1 + x1*x2)^2 + (2.25 - x1 + x1*(x2)^2)^2 + (2.625 - x1 + x1*(x2)^3)^2;
    fitness = 1 / (g + 1);
end
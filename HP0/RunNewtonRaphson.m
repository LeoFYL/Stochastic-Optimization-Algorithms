% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.
function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)
    x_current = startingPoint;
    iterationValues = x_current;
    
    while true
        f_val = GetPolynomialValue(polynomialCoefficients, x_current);
       derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 1);
       f_prime_val = GetPolynomialValue(x_current, derivativeCoefficients);


        firstDerivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, 1);
        secondDerivativeCoefficients = DifferentiatePolynomial(firstDerivativeCoefficients, 1);
        f_double_prime_val = GetPolynomialValue(x_current, secondDerivativeCoefficients);

        x_next = StepNewtonRaphson(x_current, f_prime_val, f_double_prime_val);
        
        if isnan(x_next)
            fprintf('Terminating: Received NaN from StepNewtonRaphson.\n');
            break;
        end

        iterationValues = [iterationValues, x_next];
        
        if abs(x_next - x_current) < tolerance
            break;
        end
        
        x_current = x_next;
    end
end



% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)
    n = length(polynomialCoefficients) - 1;  % Degree of the polynomial
    
    if derivativeOrder > n
        derivativeCoefficients = [];  % Return an empty array if k > n
        return;
    end
    
    derivativeCoefficients = polynomialCoefficients;  % Initialize derivative coefficients

    % Loop to calculate the k-th derivative
    for k = 1:derivativeOrder
        newCoefficients = [];
        
        for i = 1:length(derivativeCoefficients) - 1
            newCoefficients(i) = derivativeCoefficients(i + 1) * i;
        end
        
        derivativeCoefficients = newCoefficients;
    end
end

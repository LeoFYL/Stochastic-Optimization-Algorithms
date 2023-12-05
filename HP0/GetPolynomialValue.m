% This function should return the value of the polynomial f(x) = a0x^0 + a1x^1 + a2x^2 ...
% where a0, a1, ... are obtained from polynomialCoefficients.

function value = GetPolynomialValue(x, polynomialCoefficients)
    n = length(polynomialCoefficients) - 1;  % Degree of the polynomial
    value = 0;  % Initialize the output value
    
    for i = 0:n
        coefficient = polynomialCoefficients(i + 1);  % Matlab indices start at 1
        term = coefficient * (x .^ i);  % Compute each term in the polynomial (note the .^)
        value = value + term;  % Add each term to the total value
    end
end



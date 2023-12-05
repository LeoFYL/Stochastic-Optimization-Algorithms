% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)

    if isempty(iterationValues)
        fprintf('No iteration values provided. Terminating plot generation.\n');
        return;
    end
    
    % Calculate the function values at iteration points
   f_values = arrayfun(@(x) GetPolynomialValue(x, polynomialCoefficients), iterationValues);

    % Create x values for plotting the polynomial. Here, I'm using the range from the minimum to maximum iterate.
    x = linspace(min(iterationValues) - 2, max(iterationValues) + 2, 400);
    
    % Calculate the y values based on the polynomial
   y = arrayfun(@(x_val) GetPolynomialValue(x_val, polynomialCoefficients), x);


    
    figure;
    hold on;
    
    % Plot the polynomial
    plot(x, y, 'g-', 'LineWidth', 2);
    
    % Plot the iteration values as red circles
    scatter(iterationValues, f_values, 'ro');
    
 
    xlabel('x');
    ylabel('f(x)');
    
    
    grid on;
    legend('Polynomial', 'Iterates');
    
    hold off;
end





% This method should perform a single step of the Newton-Raphson method.
% Note: In cases where the step cannot be completed, e.g. if f" = 0, a
% clear error message should be given.

function xNext = StepNewtonRaphson(x, fPrime, fDoublePrime)
    if fDoublePrime == 0
        fprintf('Error: The second derivative is zero. Newton-Raphson method cannot proceed.\n');
        xNext = NaN;
        return;
    end
    xNext = x - fPrime / fDoublePrime;
end



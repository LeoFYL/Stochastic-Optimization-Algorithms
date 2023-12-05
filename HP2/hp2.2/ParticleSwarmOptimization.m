function [bestPosition, bestValue] = ParticleSwarmOptimization(func, lb, ub, maxIter, particleSize)
    dim = length(lb);
    inertia = 1.2;
    c1 = 1.5;
    c2 = 1.5;
    
    position = repmat(lb, particleSize, 1) + rand(particleSize, dim) .* (repmat(ub - lb, particleSize, 1));
    velocity = -0.1 + 0.2 * rand(particleSize, dim);
    pBest = position;
    pBestValue = arrayfun(@(idx) func(position(idx, :)), 1:size(position, 1));

    
    [bestValue, bestIndex] = min(pBestValue);
    bestPosition = pBest(bestIndex, :);
    
    for iter = 1:maxIter
        for i = 1:particleSize
            velocity(i, :) = inertia * velocity(i, :) + c1 * rand * (pBest(i, :) - position(i, :)) + c2 * rand * (bestPosition - position(i, :));
            position(i, :) = position(i, :) + velocity(i, :);
            
            currValue = func(position(i, :));
            if currValue < pBestValue(i)
                pBest(i, :) = position(i, :);
                pBestValue(i) = currValue;
            end
        end
        
        [currBestValue, bestIndex] = min(pBestValue);
        if currBestValue < bestValue
            bestValue = currBestValue;
            bestPosition = pBest(bestIndex, :);
        end
        inertia = 0.9 - 0.5 * (iter/maxIter);
    end
end

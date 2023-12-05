function result = RunPSO()
    lb = [-5, -5];
    ub = [5, 5];
    
    results = [];
    for i = 1:30
        [bestPos, bestValue] = ParticleSwarmOptimization(@ObjectiveFunction, lb, ub, 100, 30);
        results = [results; bestPos, bestValue];
    end
    result = unique(results, 'rows');
end

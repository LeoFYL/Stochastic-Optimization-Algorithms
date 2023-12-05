function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)
    numberOfAnts = size(pathCollection, 1);
    numberOfCities = size(pathCollection, 2);
    deltaPheromoneLevel = zeros(numberOfCities, numberOfCities);
    
    for k = 1:numberOfAnts
        path = pathCollection(k, :);
        for i = 1:(numberOfCities - 1)
            deltaPheromoneLevel(path(i), path(i+1)) = deltaPheromoneLevel(path(i), path(i+1)) + 1/pathLengthCollection(k);
        end
        deltaPheromoneLevel(path(numberOfCities), path(1)) = deltaPheromoneLevel(path(numberOfCities), path(1)) + 1/pathLengthCollection(k);
    end
end
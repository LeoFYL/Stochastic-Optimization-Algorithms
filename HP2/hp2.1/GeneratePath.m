function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    numberOfCities = size(pheromoneLevel, 1);
    path = zeros(1, numberOfCities);
    visitedCities = false(1, numberOfCities);
    
    % Start from a random city
    currentCity = randi(numberOfCities);
    path(1) = currentCity;
    visitedCities(currentCity) = true;

    for i = 2:numberOfCities
        transitionProbabilities = (pheromoneLevel(currentCity, :) .^ alpha) .* (visibility(currentCity, :) .^ beta);
        transitionProbabilities(visitedCities) = 0; % set the cities visited to have zero probability
        transitionProbabilities = transitionProbabilities / sum(transitionProbabilities);
        
       

        nextCity = randsample(1:numberOfCities, 1, true, transitionProbabilities);
        
        path(i) = nextCity;
        currentCity = nextCity;
        visitedCities(nextCity) = true;
    end
end

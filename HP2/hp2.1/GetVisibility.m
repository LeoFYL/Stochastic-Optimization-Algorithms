function visibility = GetVisibility(cityLocation)
    numberOfCities = length(cityLocation);
    visibility = zeros(numberOfCities);
    for i = 1:numberOfCities
        for j = 1:numberOfCities
            if i ~= j
                visibility(i,j) = 1 / norm(cityLocation(i,:) - cityLocation(j,:));
            end
        end
    end
end

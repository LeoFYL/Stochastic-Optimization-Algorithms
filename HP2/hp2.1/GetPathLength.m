function pathLength = GetPathLength(path, cityLocation)
    pathLength = 0;
    for i = 1:(length(path)-1)
        pathLength = pathLength + norm(cityLocation(path(i),:) - cityLocation(path(i+1),:));
    end
    pathLength = pathLength + norm(cityLocation(path(end),:) - cityLocation(path(1),:)); % Return to start
end

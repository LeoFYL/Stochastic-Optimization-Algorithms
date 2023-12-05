%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...





% Define an array of mutation probabilities to explore
mutationRates = [0, 0.01, 0.02, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 1];

% Initialize a vector to store the median fitness for each mutation rate
medians = zeros(length(mutationRates), 1);

% Loop over each mutation rate
for idx = 1:length(mutationRates)
    mutationProbability = mutationRates(idx);
    fprintf('Mutation rate = %0.5f\n', mutationProbability);
    
    % Initialize vector to store maximum fitness of each run
    maximumFitnessList = zeros(numberOfRuns, 1);
    
    % Perform multiple runs for this mutation rate
    for i = 1:numberOfRuns
        [maximumFitness, ~] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                  tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
        fprintf('Run: %d, Score: %0.10f\n', i, maximumFitness);
        maximumFitnessList(i) = maximumFitness;
    end
    
    % Compute statistics
    medianValue = median(maximumFitnessList);
    medians(idx) = medianValue;
    
    fprintf('PMut = %0.2f: Median: %0.10f\n', mutationProbability, medianValue);
end

% Plotting
figure;
plot(mutationRates, medians, '-o');
xlabel('Mutation Rate');
ylabel('Median Fitness');
title('Impact of Mutation Rate on Median Fitness');

% ... and here (pMut > 0.02)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...

% average002 = mean(maximumFitnessList002);
% median002 = median(maximumFitnessList002);
% std002 = sqrt(var(maximumFitnessList002));
% sprintf('PMut = 0.02: Median: %0.10f, Average: %0.10f, STD: %0.10f', median002, average002, std002)

% ... and here (pMut > 0.02)

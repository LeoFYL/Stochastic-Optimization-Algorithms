



function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
   
   populationSize = numel(fitnessList);
    participants = randi(populationSize, [1, tournamentSize]);
    [~, idx] = sort(fitnessList(participants), 'descend');
    
    for i = 1:tournamentSize
        if rand < tournamentProbability
            selectedIndividualIndex = participants(idx(i));
            return;
        end
    end
    selectedIndividualIndex = participants(idx(end));
end

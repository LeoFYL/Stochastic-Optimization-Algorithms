function mutatedIndividual = Mutate(individual, mutationProbability)
 nGenes = numel(individual);
  mutatedIndividual = individual;

  for j = 1:nGenes
    if rand < mutationProbability
      mutatedIndividual(j) = 1 - individual(j);
    end
  end
end

% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome, numberOfVariables, maximumVariableValue)
  nGenes = length(chromosome);
  k = nGenes / numberOfVariables;
  x = zeros(1, numberOfVariables);
  
  for i = 1:numberOfVariables
    geneStart = (i - 1) * k + 1;
    geneEnd = i * k;
    gene = chromosome(geneStart:geneEnd);
    x(i) = -maximumVariableValue + 2 * maximumVariableValue * (bin2dec(num2str(gene)) / (2^k - 1));
  end
end



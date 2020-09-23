% Shuffles the data you provide.
%
% [SHUFFLEDDATA, SHUFFLEDDATALABELS] = SHUFFLEROWS( DATA, DATALABELS )
%
% Arguments: 'data' should be a training data matrix of N examples (N rows),
%  and M dimensions for each (M columns).
% 'datalabels' should be a Nx1 column vector of labels.
%
% Returns: Shuffled data.
%
% HINT: set the random number seed with:
%
%     rand('state', seed)
%
% to allow reproduciblity of experimental results.
%
function [shuffleddata, shuffleddatalabels] = shufflerows( data, datalabels )


permutation = randperm( size(data,1) );

shuffleddata = data(permutation, :);
shuffleddatalabels = datalabels(permutation, :);


%  K-nearest Neighbour classifier
%
%  Y = KNEAREST( k, x, data, truelabels )
%
%  Arguments:
%  'data' should be a N rows by M columns matrix of data, composed
%  of N training examples, each with M dimensions.
%
%  'truelabels' should be a Nx1 column vector, with class labels.
%
%  'x' is the data vector, size 1xM, where the knn estimate is required.
%
%  'k' is the number of neighbours to take into account.
%  Note that even values will result in ties broken randomly.
%
%  Returns:
%  'y' - a predicted class label for your data vector 'x'
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  YOU SHOULD NOT BE EDITING THIS CODE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = knearest( k, x, data, datalabels )

%get data characteristics
numtrain = size(data,1);
numfeatures = size(data,2);

if size(x,2) ~= numfeatures
   error('Test data dimensions does not match train data dimensions.');
end

if k > numtrain
   error( ['Not enough training samples to use k = ' num2str(k) ' (you only supplied ' num2str(numtrain) ')'] );
end

%copy the test example 'numtrain' times
protos = repmat(x, numtrain, 1);

%measure the Euclidean distance from this test example to every training example
distances = [ sqrt(sum((data - protos).^2,2)) datalabels ];

%sort them according to distances (find nearest neighbours)
distances = sortrows(distances);

%calculate the most common class in the nearest 'k' neighbours
y = mode( distances(1:k,2)' );





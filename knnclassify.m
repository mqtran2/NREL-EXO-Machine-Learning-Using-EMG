%
% KNNCLASSIFY	Classifies using a k-nearest neighbor
%
% [TrainErr,TestErr,TrainPredict,TestPredict] = KNNCLASSIFY(TrainData,TestData,TrainClass,TestClass,K)
%
% Author Adrian Chan
%
% This function classifies using a k-nearest neighbor.
%
% Requires the NetLab toolbox (http://www.ncrg.aston.ac.uk/netlab/down.php)
%
% Inputs
%    TrainData      train data arranged in columns
%    TestData		test data arranged in columns
%    TrainClass     vectors of train class membership
%    TestClass      vectors of test class membership
%    K              number of nearest neighbors to use (default 1)
%
% Outputs
%    TrainErr		probability of error for train data
%    TestErr		probability of error for test data
%    TrainPredict   predicted class for train data
%    TestPredict    predicted class for test data
%
% Modifications
% 06/09/11 AC First created.
function [TrainErr,TestErr,TrainPredict,TestPredict] = knnclassify(TrainData,TestData,TrainClass,TestClass,K)

if nargin < 5
    K = 1;
end

Nclass = max(TrainClass);
Nfeat = size(TrainData,2);

train_target = ind2vec(TrainClass);
net = knn(Nfeat,Nclass,K,TrainData,train_target');

[count_train,TrainPredict] = knnfwd(net,TrainData);
[count_test,TestPredict] = knnfwd(net,TestData);

TrainErr = sum(TrainPredict ~= TrainClass)/length(TrainClass)*100;
TestErr = sum(TestPredict ~= TestClass)/length(TestClass)*100;

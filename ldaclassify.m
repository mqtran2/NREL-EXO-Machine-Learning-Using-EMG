%
% LDACLASSIFY	Classifies using a linear discrminant analysis
%
% [TrainErr,TestErr,TrainPredict,TestPredict] = LDACLASSIFY(TrainData,TestData,TrainClass,TestClass)
%
% Author Adrian Chan
%
% This function classifies using a linear discriminant analysis.
%
% Inputs
%    TrainData      train data arranged in columns
%    TestData		test data arranged in columns
%    TrainClass     vectors of train class membership
%    TestClass      vectors of test class membership
%
% Outputs
%    TrainErr		probability of error for train data
%    TestErr		probability of error for test data
%    TrainPredict   predicted class for train data
%    TestPredict    predicted class for test data
%
% Modifications
% 06/09/11 AC First created.
function [TrainErr,TestErr,TrainPredict,TestPredict] = ldaclassify(TrainData,TestData,TrainClass,TestClass)

TrainPredict = classify(TrainData,TrainData,TrainClass);
TestPredict = classify(TestData,TrainData,TrainClass);

TrainErr = sum(TrainPredict ~= TrainClass)/length(TrainClass)*100;
TestErr = sum(TestPredict ~= TestClass)/length(TestClass)*100;

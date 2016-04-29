%
% ULDA_FEATURE_REDUCTION Feature reduction using uncorrelated linear
% discriminant analysis
%
% function [feature_train_ulda,feature_test_ulda] 
%   = ulda_feature_reduction(feature_train,Nfeat_out,class_train,feature_test)
%
% Author Adrian Chan
%
% Performs feature reduction using uncorrelated linear discriminant
% analysis (ULDA).
%
% Reference J. Ye, R. Janardan, Q. Li, H. Park, "Feature extraction via
% generalized uncorrelated linear discriminant analysis", Proceedings of
% thte 21st International Conference on Machine Learning, Banff, Canada,
% 2004.
%
% Requires ULDA.m file from http://www-users.cs.umn.edu/~jieping/uLDA/
%
% Inputs
%    feature_train: input matrix of training features
%                   (rows: examplars, columns: features)
%    Nfeat_out: number of features to reduce to (default inf; i.e. keep as
%               many features as possible)
%    class_train: column vector of training classes
%    feature_test: input matrix of testing features
%                  (rows: examplars, columns: features)
%                  These will be projected using the projection matrix
%                  determined from the feature_train.
%                  (default: empty)
%
% Outputs
%    feature_train_ulda: output matrix of training features
%    feature_test_ulda: output matrix of testing features
%
% Modifications
% 06/10/04 AC First created.
function [feature_train_ulda,feature_test_ulda] = ulda_feature_reduction(feature_train,Nfeat_out,class_train,feature_test)

if nargin < 3
    feature_test = [];
end

G = ulda(feature_train, class_train);
feature_train_ulda = (feature_train*G);
Nfeat_ulda = size(feature_train_ulda,2);
Nfeat_out = min(Nfeat_out,Nfeat_ulda);
feature_train_ulda = feature_train_ulda(:,1:Nfeat_out);

if isempty(feature_test)
    feature_test_ulda = [];
else
    feature_test_ulda = (feature_test*G);
    feature_test_ulda = feature_test_ulda(:,1:Nfeat_out);
end


%
% PCA_FEATURE_REDUCTION Feature reduction using principal component
% analysis
%
% function [feature_train_pca,feature_test_pca] 
%   = pca_feature_reduction(feature_train,Nfeat_out,feature_test)
%
% Author Adrian Chan
%
% Performs feature reduction using principal component analysis
%
% Inputs
%    feature_train: input matrix of training features
%                   (rows: examplars, columns: features)
%    Nfeat_out: number of features to reduce to (default inf; i.e. keep as
%               many features as possible)
%    feature_test: input matrix of testing features
%                  (rows: examplars, columns: features)
%                  These will be projected using the projection matrix
%                  determined from the feature_train.
%                  (default: empty)
%
% Outputs
%    feature_train_pca: output matrix of training features
%    feature_test_pca: output matrix of testing features
%
% Modifications
% 06/10/04 AC First created.
function [feature_train_pca,feature_test_pca] = pca_feature_reduction(feature_train,Nfeat_out,feature_test)

if nargin < 3
    feature_test = [];
end

feature_train = feature_train';
feature_test = feature_test';

% cannot output more features than you provide in the input
Nfeat_in = size(feature_train,1);
Nfeat_out = min(Nfeat_out,Nfeat_in);

[feature_train,ps] = mapstd(feature_train);
[feature_train_pca,pca_settings] = processpca(feature_train);
feature_train_pca = feature_train_pca(1:Nfeat_out,:);

if isempty(feature_test)
    feature_test_pca = [];
else
    feature_test = mapstd('apply',feature_test,ps);
    feature_test_pca = processpca('apply',feature_test,pca_settings);
    feature_test_pca = feature_test_pca(1:Nfeat_out,:);
end

feature_train_pca = feature_train_pca';
feature_test_pca = feature_test_pca';

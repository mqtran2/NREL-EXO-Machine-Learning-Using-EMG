%
% RANK_CLASSIFY Given scores this function gives the associated ranks.
%
% id = rank_classify(score)
%
% Author Adrian Chan
%
% Inputs
%    score: classification scores (each row is a different set of
%           classification scores and each column is the score for that
%           particular class (i.e. col i is for class i)
%
% Outputs
%    rank: ranks according to highest score
%
% Modifications
% 05/01/14 AC Changed so score input matrix is organized with each
%             classification in a different row
% 02/08/02 AC First created.

function rank = rank_classify(score)

[M,N] = size(score);

[temp indx1] = sort(score,2);
[temp2 indx2] = sort(indx1,2);
rank = N-indx2+1;

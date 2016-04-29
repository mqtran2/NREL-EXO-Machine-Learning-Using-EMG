%
% SCORE_CLASSIFY Given scores this function classifies by the highest score.
%
% id = score_classify(score)
%
% Author Adrian Chan
%
% This produces an id for the highest score. Multiple scores are arranged
% in rows. The id corresponds to the column number.
%
% Inputs
%    score: classification scores
%
% Outputs
%    id: classification result (column with highest score)
%
% Modifications
% 05/01/14 AC Changed so score input matrix is organized with each
%             classification in a different row
% 01/08/02 AC First created.

function id = score_classify(score)

N = size(score,2);

[sort_score id] = sort(score,2);

id = id(:,N);

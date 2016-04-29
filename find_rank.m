%
% FIND_RANK Given scores and actual class this function determine the rank of that class.
%
% rank = find_rank(class,score)
%
% Author Adrian Chan
%
% The higher the score the more likely the class is chosen. The function finds out which
% rank the score is for the specified class.
%
% Inputs
%    class: actual class (class specified with number from 1 to N = #cols in score)
%    score: classification scores (should contain N columns, each row is
%           another classification result)
%
% Outputs
%    rank: rank of actual class in scores
%
% Modifications
% 05/01/14 AC Changed code such that each classification score is a row not
%             a column
% 02/03/20 AC First created.

function rank = find_rank(class,score)

Nresults = size(score,1);

ranktmp = rank_classify(score);
rank = [];
for i = 1:Nresults
    rank = [rank;ranktmp(i,class(i))];
end

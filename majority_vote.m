%
% MAJORITY_VOTE Performs a majority vote post-processing.
%
% function class_maj = majority_vote(class,before,after)
%
% Author Adrian Chan
%
% Inputs
%    class:     vector of class decisions
%    before:    number of class decisions before in the majority vote
%    after:     number of class decisions after in the majority vote
%
% Outputs
%    class_maj:     vector of class decisions with majority vote post-processing
%
% Modifications
% 03/12/10 AC Allowed for asymetric majority voting.
% 03/09/09 AC First created.
function class_maj = majority_vote(class,before,after)

class_maj = zeros(size(class)); % make a array to store majority vote results

for i = 1:length(class)
    window = class(max(1,(i-before)):min(length(class),(i+after))); % extract a window of data to perform the majority vote
    % count the number of votes for each class
    for j = 1:max(class)
        votes(j) = sum(window == j);
    end
    class_maj(i) = min(find(votes == max(votes))); % find the class with the most votes (breaking ties by choosing the smallest class
end

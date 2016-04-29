%
% CLASSIFICATION_TIMEPLOT Plots the classification results as a function of
% time
%
% function classification_timeplot(class,classification,class_marker,correct_marker,incorrect_marker)
%
% Author Adrian Chan
%
% Plots the classification results as a function of time. If required
%
% Inputs
%    class: actual class
%    classification: classification result
%    class_marker: plot marker for actual class (default 'b.')
%    correct_marker: plot marker for correct classifications (default 'g.')
%    incorrect_marker: plot marker for incorrect classifications
%                      (default 'r.')
%
% Outputs
%    none
%
% Modifications
% 06/12/07 AC First created.
function classification_timeplot(class,classification,class_marker,correct_marker,incorrect_marker)

if nargin < 5
    if nargin < 4
        if nargin < 3
            class_marker = 'b.';
        end
        correct_marker = 'go';
    end
    incorrect_marker = 'rx';
end

t = (1:length(class))';
plot(t,class,'b.');
hold on
correct_index = find(class == classification);
incorrect_index = find(class ~= classification);
plot(t(correct_index),classification(correct_index)+0.1,correct_marker);
plot(t(incorrect_index),classification(incorrect_index)+0.1,incorrect_marker);
hold off
xlabel('Window');
ylabel('Class');

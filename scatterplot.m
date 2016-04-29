%
% SCATTERPLOT Plots feature vector as a scatter plot (2-D or 3-D plot)
%
% function scatterplot(feature,class,marker)
%
% Author Adrian Chan
%
% This function creates a scatter plot of the feature vector. If there are
% more than 2 features, it will plot the first three features in a 3-D
% plot; otherwise, it will provide a 2-D plot.
%
% Inputs
%    feature: feature vector (features are in columns)
%    class: class each feature vector belongs to (column)
%    marker: list of markers used for plotting
%           default    marker = ['b.'
%                                'r.'
%                                'g.'
%                                'c.'
%                                'm.'
%                                'k.'
%                                'bx'
%                                'rx'
%                                'gx'
%                                'cx'
%                                'mx'
%                                'kx'];
%
% Outputs
%    none
%
% Modifications
% 06/12/07 AC First created.
function scatterplot(feature,class,marker)

if nargin < 3
    marker = ['b.'
              'r.'
              'g.'
              'c.'
              'm.'
              'k.'
              'bx'
              'rx'
              'gx'
              'cx'
              'mx'
              'kx'];
end

Nclass = max(class);
Nfeature = size(feature,2);
if Nfeature < 2
    feature = [feature zeros(size(feature))];
    Nfeature = 2;
end
hold off
for i = 1:Nclass
    index = find(class == i);
    if (~isempty(index))
        feature_temp = feature(index,:);
        if (Nfeature == 2)
            plot(feature_temp(:,1), feature_temp(:,2), marker(i,:));
        else
            plot3(feature_temp(:,1), feature_temp(:,2), feature_temp(:,3), marker(i,:));
        end
        hold on
    end
end
hold off
xlabel('Feature 1');
ylabel('Feature 2');
if (Nfeature > 2)
    zlabel('Feature 3');
end

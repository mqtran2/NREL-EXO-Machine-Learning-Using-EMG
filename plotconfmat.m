%
% PLOTCONFMAT Plots a confusion matrix
%
% plotconfmat(c)
%
% Author Adrian Chan
%
% This function plots a confusion matrix.
%
% Inputs
%    c: confusion matrix
%    index: labels for confusion matrix (default 1:N)
%
% Outputs
%    none
%
% Modifications
% 00/05/28 AC First created.

function tmp = plotconfmat(c,index)

N = size(c,1);

if nargin < 2
   index = 1:N;
end

bar3(index,c)

indexlabel = [];
for i = 1:N
   indexlabel = [indexlabel; sprintf('%2d',index(i))];
end

set(gca,'xtick',1:N);
set(gca,'xticklabel',indexlabel);
axistmp = axis;
axis([axistmp(1:2) index(1)-1 index(N)+1 axistmp(5:6)])
xlabel('Output')
ylabel('Input')

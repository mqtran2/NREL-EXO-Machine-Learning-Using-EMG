%
% PLOTCONFMATTEXT Plots a confusion matrix in text
%
% plotconfmat(c)
%
% Author Adrian Chan
%
% This function plots a confusion matrix in text format.
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

function tmp = plotconfmattext(c,index)

N = size(c,1);

if nargin < 2
   index = 1:N;
end

axis([index(1)-1 index(N)+1 index(1)-1 index(N)+1])

for i = 1:N
   for j = 1:N
      if (c(i,j) ~= 0)
         text(index(i),index(j),num2str(c(i,j)));
      end
   end
end

set(gca,'xtick',index);
set(gca,'ytick',index);

xlabel('Input')
ylabel('Output')

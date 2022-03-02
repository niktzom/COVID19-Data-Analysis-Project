function [pearson,p_value5,p_value1] = Group9Exe5Fun2(positivityEU_country,positivityGR)
%GROUP9EXE5FUN2 
% Function to get the exact value of the Pearson correlation coefficient
% for each of the 5 pairs of European countries and Greece.

[r,p] = corrcoef(positivityEU_country,positivityGR);
pearson  = r(1,2);
p_value5 = p(1,2); % 95% significance

% now for 99% significance
[~,p1] = corrcoef(positivityEU_country,positivityGR,'Alpha',0.01);
p_value1 = p1(1,2);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Group9Exe5Fun5(p_value5,p_value1)
%GROUP9EXE5FUN5 
% Function that takes the p-value for significance level 5% and 1%
% respectively for the correlation coefficient of each of the 5 countries
% with Greece.
% Returns whether there is significant correlation between the two countries
% at both significant levels

fprintf('---Significance test 5%%---\n'); 
if p_value5 < 0.05
    fprintf('There is statistically significant correlation\n');
else
    fprintf('There is NO statistically significant correlation\n');
end

fprintf('\n---Significance test 1%%---\n');
if p_value1 < 0.01
    fprintf('There is statistically significant correlation\n');
else
    fprintf('There is NO statistically significant correlation\n');
end
end


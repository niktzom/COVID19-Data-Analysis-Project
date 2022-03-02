%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [paramCI,bootCI] = Group9Exe4Fun2(positivityCC2020,positivityCC2021)
%GROUP9EXE4FUN2 
% Comparison of the mean weekly positivity rate in a 2 month period for
% 2020 and 2021. Both parametric and with bootstrap.
% We take CIs of the parametric and bootstrap test as outputs.

X = positivityCC2020; Y = positivityCC2021;

% Parametric CI
[~,~,paramCI,~] = ttest2(X,Y); 


% Bootstrap
B = 1000; alpha = 0.05;
lowerLim = (B+1)*alpha/2;
upperLim = B+1-lowerLim;
limits = [lowerLim upperLim]/B*100;
bootstrXmean = bootstrp(B,@mean,X);
bootstrYmean = bootstrp(B,@mean,Y);
bootMeanDiff = bootstrXmean - bootstrYmean;
bootCI = prctile(bootMeanDiff,limits);
end


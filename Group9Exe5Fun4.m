%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  Group9Exe5Fun4(positivityEU_country,positivityGR,alpha)
%GROUP9EXE5FUN3 
%
% Randomization test for singificance level alpha.

L = 1000;  n = 13;
rho = 0;
X = positivityEU_country; Y = positivityGR;
sX = std(X); mX = mean(X);
sY = std(Y); mY = mean(Y);
m = [mX mY];
sigma = [sX^2 rho*sX*sY; rho*sX*sY sY^2];
lowLim = round((alpha/2)*L);
uppLim = round((1-alpha/2)*L);

fprintf('\n---Randomization test with t-statistic %1.1d%%---\n',alpha*100);
[t0,t] = Group9Exe5Fun3(m,sigma,n,L);
tL2 = sort(t);
tLow2 = tL2(lowLim);
tUpp2 = tL2(uppLim);
if t0>tLow2 && t0<tUpp2
    fprintf('There is NO statistically significant correlation\n')
else
    fprintf('There is statistically significant correlation\n')
end
end


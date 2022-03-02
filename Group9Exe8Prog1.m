%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; close all; clc;

data = readtable('FullEodyData.xlsx','PreserveVariableNames',true);

deaths = data.New_Deaths;

% span of 3 months or 12 weeks is 84 days
n = 84;
X = zeros(n,30);

% we choose the first period to be from '15-08-2021' and backwards

deathsX = deaths(514-(n-1):514);

for i = 1:n
    X(i,:) = Group9Exe8Fun1(515-i,29);
end


adjR2array = zeros(1,5);
onesX = [ones(n,1) X];

% normal regression
[b,~,~,~,stats] = regress(deathsX,onesX);
adjR2array(1) = 1 - (1-stats(1))*((n-1)/(n-30-1));

% PCR regression
[PCAloadings,PCAscores] = pca(X,'Economy',false);
bPCR = regress(deathsX-mean(deathsX), PCAscores(:,1:2));
bPCR = PCAloadings(:,1:2)*bPCR;
bPCR = [mean(deathsX) - mean(X)*bPCR; bPCR];
yPCR = onesX*bPCR;
ePCR = yPCR - deathsX;
adjR2array(2) = 1-((n-1)/(n-length(bPCR)))*(sum(ePCR.^2))/(sum((deathsX-mean(deathsX)).^2));
    
% PLS regression
[~,~,~,~,bPLS] = plsregress(X,deathsX,1);
yPLS = onesX*bPLS;
ePLS = yPLS -deathsX;
adjR2array(3) = 1-((n-1)/(n-length(bPLS)))*(sum(ePLS.^2))/(sum((deathsX-mean(deathsX)).^2));

% RR regression
bRR = ridge(deathsX,X,1,0);
yRR = onesX*bRR;
eRR = yRR - deathsX;
adjR2array(4) = 1-((n-1)/(n-length(bRR)))*(sum(eRR.^2))/(sum((deathsX-mean(deathsX)).^2));

% LASSO regression
lambda = 1e-03;
bLASSO = lasso(X,deathsX,'Lambda',lambda);
yLASSO = X*bLASSO;
eLASSO = yLASSO - deathsX;
adjR2array(5) = 1-((n-1)/(n-length(bLASSO)))*(sum(eLASSO.^2))/(sum((deathsX-mean(deathsX)).^2));

% compare the adjusted R squared between the methods.
Methods = {'Normal';'PCR';'PLS';'RR';'LASSO'};
AdjR2 = [adjR2array(1);adjR2array(2);adjR2array(3);adjR2array(4);adjR2array(5)];
adjR2table = table(Methods,AdjR2);
disp(adjR2table);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

countriesEU = {'DE', 'HU', 'IS', 'IE', 'IT'};
alpha1 = 0.01; alpha5 = 0.05; rho = 0;
positivityRate = zeros(13,5);

for i = 1:5 
    positivityRate(:,i) = Group9Exe5Fun1(countriesEU(i));
end

% Positivity rates for each country in the last 3 months of 2021.
positivityDE = positivityRate(:,1); %Germany
positivityHU = positivityRate(:,2); %Hungary
positivityIC = positivityRate(:,3); %Iceland
positivityIR = positivityRate(:,4); %Ireland
positivityIT = positivityRate(:,5); %Italy
positivityGR = Group9Exe5Fun1('EL'); %Greece

% Pearson correlation coefficients for each pair the 5 european countries
% with Greece.
[pearsonDE,p5DE,p1DE] = Group9Exe5Fun2(positivityDE,positivityGR);
[pearsonHU,p5HU,p1HU] = Group9Exe5Fun2(positivityHU,positivityGR);
[pearsonIC,p5IC,p1IC] = Group9Exe5Fun2(positivityIC,positivityGR);
[pearsonIR,p5IR,p1IR] = Group9Exe5Fun2(positivityIR,positivityGR);
[pearsonIT,p5IT,p1IT] = Group9Exe5Fun2(positivityIT,positivityGR);

lgdDE = sprintf('Germany: r=%1.4f',pearsonDE);
lgdHU = sprintf('Hungary: r=%1.4f',pearsonHU);
lgdIC = sprintf('Iceland: r=%1.4f',pearsonIC);
lgdIR = sprintf('Ireland: r=%1.4f',pearsonIR);
lgdIT = sprintf('Italy: r=%1.4f',pearsonIT);
figure()
scatter(positivityGR,positivityDE)
hold on;
scatter(positivityGR,positivityHU,'x')
hold on;
scatter(positivityGR,positivityIC,'h')
hold on;
scatter(positivityGR,positivityIR,'*')
hold on;
scatter(positivityGR,positivityIT,100,'.')
hold off;
title('Positivity of each European country with Greece');
legend(lgdDE,lgdHU,lgdIC,lgdIR,lgdIT,'Location','northwest');


fprintf(['Pearson correlation coefficients for each pair of the 5 Εuropean'...
' countries with Greece:\n']);
% Germany
fprintf('\n#######Germany#######\nr=%0.4f\n',pearsonDE); 
Group9Exe5Fun5(p5DE,p1DE)
Group9Exe5Fun4(positivityDE,positivityGR,alpha5)
Group9Exe5Fun4(positivityDE,positivityGR,alpha1)
% Hungary
fprintf('\n#######Hungary#######\nr=%0.4f\n',pearsonHU); 
Group9Exe5Fun5(p5HU,p1HU)
Group9Exe5Fun4(positivityHU,positivityGR,alpha5)
Group9Exe5Fun4(positivityHU,positivityGR,alpha1)
% Iceland
fprintf('\n#######Iceland#######\nr=%0.4f\n',pearsonIC);
Group9Exe5Fun5(p5IC,p1IC)
Group9Exe5Fun4(positivityIC,positivityGR,alpha5)
Group9Exe5Fun4(positivityIC,positivityGR,alpha1)
%Ireland
fprintf('\n#######Ireland#######\nr=%0.4f\n',pearsonIR); 
Group9Exe5Fun5(p5IR,p1IR)
Group9Exe5Fun4(positivityIR,positivityGR,alpha5)
Group9Exe5Fun4(positivityIR,positivityGR,alpha1)
% Italy
fprintf('\n#######Italy#######\nr=%0.4f\n',pearsonIT); 
Group9Exe5Fun5(p5IT,p1IT)
Group9Exe5Fun4(positivityIT,positivityGR,alpha5)
Group9Exe5Fun4(positivityIT,positivityGR,alpha1)

% CONCLUSIONS
% In the Command Window we can see if there is significant correlation
% between Greece and each of the 5 European countries. The bigger
% correlation is observed with Hungary.
% At 5% SL there is statistically significant correlation with every country
% except Italy (expected as rIT = 0.2532, too low!)
% At 1% SL there is statistically significant correlation with
% Germany,Hungary and Ireland (the 3 countries with the higher correlation
% coefficients).
% Unfortunately every randomization test shows no statistically significant
% correlation at any level between the European countries and Greece.
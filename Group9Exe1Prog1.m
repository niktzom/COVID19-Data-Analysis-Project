%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Program for the 1st exercise of the project.
% AEM: 9461 and mod(9461,25)= 11 so we have Hungary as our 'A' country.

clc;
clear;
close all;

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);

% We check on which week of the last 6 of each year the positivity rate in
% Hungary is at its peak and we will use those 2 week to continue.
maxPositivity_weeks = Group9Exe1Fun1('HU');
positivity20 = Group9Exe1Fun2(maxPositivity_weeks(1)); %positivity rate table for 2020
positivity21 = Group9Exe1Fun2(maxPositivity_weeks(2)); %positivity rate table for 2021

distributions = {'Normal';'Gamma';'Exponential';'InverseGaussian';
'Logistic';'Poisson';'Rician';'HalfNormal';'Nakagami';'Rayleigh'};

weeks20 = 1:length(positivity20);
weeks21 = 1:length(positivity21);

normPositivity20 = positivity20./sum(positivity20);
normPositivity21 = positivity21./sum(positivity21);

mse20 = zeros(length(distributions),1);
mse21 = zeros(length(distributions),1);
for i = 1:length(distributions)
    
    probDistribution20 = fitdist(positivity20,distributions{i});
    fittedPDF20 = pdf(probDistribution20,positivity20);

    mse20(i) = 1/(length(normPositivity20)-1)*sum((normPositivity20-fittedPDF20).^2);
    
    figure
    histfit(positivity20,7,distributions{i})
    title(sprintf('2020 - %s',distributions{i}));
    xlabel('Weeks'); ylabel('Positivity Rate');
    
    
    probDistribution21 = fitdist(positivity21,distributions{i});
    fittedPDF21 = pdf(probDistribution21,positivity21);

    mse21(i) = 1/(length(normPositivity21)-1)*sum((normPositivity21-fittedPDF21).^2);

    figure
    histfit(positivity21,7,distributions{i})
    title(sprintf('2021 - %s',distributions{i}));
    xlabel('Weeks'); ylabel('Positivity Rate');    

end

[~,idxBestMSE20] = min(mse20);
[~,idxBestMSE21] = min(mse21);

bestDist20 = distributions(idxBestMSE20);
bestDist21 = distributions(idxBestMSE21);

% Display results
fprintf('Best fitted distribution to positivity rate of 2020 is: %s Distribution\n',bestDist20{1});
fprintf('Best fitted distribution to positivity rate of 2021 is: %s Distribution\n',bestDist21{1});


% figure(1)
% pd20N = fitdist(positivity20,'Normal')
% histfit(positivity20,6,'Normal');
% hold on;
% histfit(positivity20,6,'Exponential');
% title(sprintf('Positivity Rate on %s in Europe',maxPositivity_weeks{1}));
% 
% figure(2)
% pd21N = fitdist(positivity21,'Normal')
% histfit(positivity21,6,'normal');
% title(sprintf('Positivity Rate on %s in Europe',maxPositivity_weeks{2}));
% 
figure()
histfit(positivity20);

figure()
histfit(positivity21);

%% Conclusion
% Best fitted distribution in both spans seems to be the Normal 
% distribution so we conclude that we can describe them with one 
% distribution as it is asked in the exercise.
% Test for the following distributions were made:
% 'Normal','Gamma','Exponential','InverseGaussian','Logistic','Poisson',
% 'Rician','HalfNormal','Nakagami','Rayleigh'.

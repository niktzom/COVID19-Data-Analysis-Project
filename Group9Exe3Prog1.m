%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Our counrty A is Hungary. We can see from 'ECDC-7Days-Testing' file that 
% the climax on the positivity rate in this country occurs in 2021-W11, so
% we are going to use 12 continuous weeks up to that date for our exercise.

clear;
close all;
clc;
weeks = {'2020-W53','2021-W01','2021-W02','2021-W03','2021-W04','2021-W05','2021-W06',...
    '2021-W07','2021-W08','2021-W09','2021-W10','2021-W11'};

positivityRateEU = zeros(12,1);
positivityRateGR = zeros(12,1);
statisticalDiff = zeros(12,1);
weeksCounter = linspace(1,12,12);

for i = 1:12
    [positivityRateEU(i),positivityRateGR(i),statisticalDiff(i)] = ...
        Group9Exe3Fun1(weeks{i});
end

figure
plot(positivityRateEU,'-','LineWidth',1.5);
hold on;
plot(positivityRateGR,'-','LineWidth',1.5);
grid on;
xCenter = 1:1:length(positivityRateEU);
yCenter = (positivityRateEU+positivityRateGR)/2;
for j = 1 : length(xCenter)
	textLabel = sprintf('%.1f', statisticalDiff(j));
	text(xCenter(j), yCenter(j), textLabel, 'HorizontalAlignment', 'center')
end
title(sprintf(['Statistical Difference of positivity rates in Europe and Greece\n'...
'between ''2020-W53'' and ''2021-W11''']));
xlabel('Weeks'); ylabel('Positivity Rate');
xlim([1 12]);
xticklabels({weeks{1:12}}); xtickangle(45);
legend('Positivity Rate in EU','Positivity Rate in GR');
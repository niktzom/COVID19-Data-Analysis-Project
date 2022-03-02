%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; close all; clc;

[~,deathsPer1M] = Group9Exe7Fun2;

figure(1)
plot(deathsPer1M)
title('Weekly deaths per 1 million for Hungary');
xlabel('Weeks'); ylabel('Deaths');

% We want to work on two different 4 months period(16 weeks). From figure 1
% we can see two spikes on the weekly deaths per 1 million. Those are in
% 2021-W19 and 2021-W48 respectively. So we are going to take data from 2
% different four months periods each one ending at one of the above weeks.

% For the 1st weekspan from 2021-W19 backward we take 5 different spans
% with delays from 1 to 5 weeks. We are doing the same for the spans from
% spike number 2 in 2021-W48.
weekspan1 = cell(16,5); weekspan2 = cell(16,5);
delay = [1 2 3 4 5];
deathSpan1 = zeros(16,5); deathSpan2 = zeros(16,5);
positivityRate1 = zeros(16,5); positivityRate2 = zeros(16,5);

for i=1:5
    % span1
    [weekspan1(:,i),deathSpan1(:,i)] = Group9Exe7Fun3('2021-W19',delay(i));
    positivityRate1(:,i) = Group9Exe7Fun1(weekspan1(:,i));
    
    % span2
    [weekspan2(:,i),deathSpan2(:,i)] = Group9Exe7Fun3('2021-W48',delay(i));
    positivityRate2(:,i) = Group9Exe7Fun1(weekspan2(:,i));
end

% Scatter plots to visualize the data
Group9Exe7Fun4(deathSpan1,positivityRate1,1)
Group9Exe7Fun4(deathSpan2,positivityRate2,2)

% Linear Models
mdlSpan1 = cell(5,1); mdlSpan2 = cell(5,1);
for j=1:5
    mdlSpan1{j} = fitlm(deathSpan1(:,j),positivityRate1(:,j));
    mdlSpan2{j} = fitlm(deathSpan2(:,j),positivityRate2(:,j));
end

fprintf('################Data for the 1st span################\n\n');
Group9Exe7Fun5(mdlSpan1)
fprintf('\n################Data for the 2nd span#################\n\n');
Group9Exe7Fun5(mdlSpan2)

% CONCLUSIONS: We can notice that the linear models in the first span
% differ from that in the second one.
% In the 1st span of 4 months we see a better linear model when we have a
% delay of only 1 week between the measurements of deaths per 1 million
% inhabitants and the corresponding positivity rate of the population.
% However in the 2nd span of 4 months the best linear model seems to be
% when the delay between the data is 5 weeks (bigger R,adjR and smaller
% RMSE values).
% So we could say that predicting the COVID deaths in a country base on the
% weekly positivity rate of the population is not something we can do with
% certainity.
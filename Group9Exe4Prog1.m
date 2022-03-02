%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

% Country 'A' is Hungary so the four neighbors countries alphabetically are
% Germany, Greece, Iceland and Ireland. We are not taking Greece into
% consideration because of exercise 5 and the other candidate France misses
% all of the last weeks in 2020. So instead we choose Italy.

countries = {'DE', 'HU', 'IS', 'IE', 'IT'};

positivityRate20 = zeros(9,5);
positivityRate21 = zeros(9,5);

for i = 1:5
    [positivityRate20(:,i),positivityRate21(:,i)] = Group9Exe4Fun1(countries(i));
end

positivityDE20 = positivityRate20(:,1); positivityDE21 = positivityRate21(:,1); %Germany
positivityHU20 = positivityRate20(:,2); positivityHU21 = positivityRate21(:,2); %Hungary
positivityIC20 = positivityRate20(:,3); positivityIC21 = positivityRate21(:,3); %Iceland
positivityIR20 = positivityRate20(:,4); positivityIR21 = positivityRate21(:,4); %Ireland
positivityIT20 = positivityRate20(:,5); positivityIT21 = positivityRate21(:,5); %Italy

% % Boxplots for the distribution of the positivity rates
% figure()
% boxplot(positivityRate20,'Labels',{'Germany','Hungary','Iceland','Ireland','Italy'})
% title('Weekly positivity rate in 2020'); xlabel('Countries'); ylabel('Positivity Rate'); 
% 
% figure()
% boxplot(positivityRate21,'Labels',{'Germany','Hungary','Iceland','Ireland','Italy'})
% title('Weekly positivity rate in 2021'); xlabel('Countries'); ylabel('Positivity Rate');

% Parametric and bootstrap check 
[parDE,bootDE] = Group9Exe4Fun2(positivityDE20,positivityDE21);
[parHU,bootHU] = Group9Exe4Fun2(positivityHU20,positivityHU21);
[parIC,bootIC] = Group9Exe4Fun2(positivityIC20,positivityIC21);
[parIR,bootIR] = Group9Exe4Fun2(positivityIR20,positivityIR21);
[parIT,bootIT] = Group9Exe4Fun2(positivityIT20,positivityIT21);

%plots
Group9Exe4Fun3(parDE,parHU,parIC,parIR,parIT,'Parametric Check')
Group9Exe4Fun3(bootDE,bootHU,bootIC,bootIR,bootIT,'Bootstrap Check')


% CONCLUSIONS
% From the plots produced from our program we can see that only Hungary our
% 'A' country seems to not have a significant difference on its positivity
% rate on the last 2 months of each year respectively. That's because both
% with the parametric and bootstrap testing the Null Hypothesis Testing is
% confirmed in contrast to the other 4 countries.
% However in Exe4Fun1 we have replaced weeks 49 and 50 from Hungary with
% week 51 and 52 respectively because those 2 were missing so the result
% cannot be taken as 100% right.

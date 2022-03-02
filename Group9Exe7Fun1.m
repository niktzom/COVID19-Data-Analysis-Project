%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [positivityRate] = Group9Exe7Fun1(weekspan)
%Group9Exe7Fun1 
% Function that take a week span of four months as input and returns a
% table with the positivity rate of Hungary in this span.

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);
weeks = length(weekspan);
ourCountryA = 'HU';
counter = 0;
positivityRate = zeros(weeks,1);

for i = 1:len
    for j = 1:weeks
        if (strcmp([data.year_week{i}], weekspan(j)) &&...
           strcmp([data.level{i}],'national') &&...
           strcmp([data.country_code{i}],ourCountryA))
            counter = counter + 1;
            positivityRate(counter) = data.positivity_rate(i);
        end
    end
end
end


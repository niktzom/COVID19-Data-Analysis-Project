%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [maxPositivity_weeks] = Group9Exe1Fun1(CountryCode)
%GROUP9EXE1FUN1 
% This function looks for the the biggest positivity rate of the given
% country in the last 6 weeks of 2020 and 2021 and returns the two weeks of 
% each year repsectively where that country displays its biggest positivity
% rate of COVID19 cases.

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);
weeks20 = {'2020-W45','2020-W46','2020-W47','2020-W48','2020-W48','2020-W50'};
weeks21 = {'2020-W45','2021-W46','2021-W47','2021-W48','2021-W48','2021-W50'};
maxPos_rate20 = 0; maxPos_rate21 = 0; 
week20 = ''; week21 = '';

for i = 1:len
    for j = 1:6
        if (strcmp([data.country_code{i}], CountryCode) && ...
            strcmp([data.level{i}],'national') &&...
            strcmp([data.year_week{i}],weeks20(j))) 
           if data.positivity_rate(i) > maxPos_rate20
               maxPos_rate20 = data.positivity_rate(i);
               week20 = data.year_week(i);
           end
        end
    end
    for k = 1:6
        if (strcmp([data.country_code{i}], CountryCode) && ...
            strcmp([data.level{i}],'national') &&...
            strcmp([data.year_week{i}],weeks21(k))) 
           if data.positivity_rate(i) > maxPos_rate21
               maxPos_rate21 = data.positivity_rate(i);
               week21 = data.year_week(i);
           end
        end
    end
end
maxPositivity_weeks = [week20; week21];
end


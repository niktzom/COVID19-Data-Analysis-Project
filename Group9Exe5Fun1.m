%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [positivityRate] = Group9Exe5Fun1(countryCode)
%GROUP9EXE5FUN1 
% Function that takes a country code as input and returns an array with the
% positivity rate of the country over the 13 week period (2021-W38 to
% 2021-W50).

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);

weeks =  {'2021-W38','2021-W39','2021-W40','2021-W41','2021-W42',...
    '2021-W43','2021-W44','2021-W45','2021-W46','2021-W47',...
    '2021-W48','2021-W49','2021-W50'};

counter = 0;
positivityRate = zeros(13,1);

for i = 1:len
    for j = 1:13
        if (strcmp([data.year_week{i}], weeks(j)) &&...
           strcmp([data.level{i}],'national') &&...
           strcmp([data.country_code{i}],countryCode))
            counter = counter + 1;
            positivityRate(counter) = data.positivity_rate(i);
        end
    end
end
end


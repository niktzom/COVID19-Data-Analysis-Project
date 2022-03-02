%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [positivityRate20,positivityRate21] = Group9Exe4Fun1(countryCode)
%GROUP9EXE4FUN1 
% Function that takes a country code as input and returns two arrays with
% the positivity rates from the last 8 weeks of 2020 and 2021. 

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);

% weeks 49 and 50 are missing from our country 'A' Hungary so I am
% replacing those 2 weeks with 51 and 52 respectively.
if strcmp(countryCode ,'HU')
    weeks2020 = {'2020-W42','2020-W43','2020-W44','2020-W45','2020-W46',...
    '2020-W47','2020-W48','2020-W51','2020-W52'};
else
    weeks2020 = {'2020-W42','2020-W43','2020-W44','2020-W45','2020-W46',...
    '2020-W47','2020-W48','2020-W49','2020-W50'};
end

weeks2021 = {'2021-W42','2021-W43','2021-W44','2021-W45','2021-W46',...
    '2021-W47','2021-W48','2021-W49','2021-W50'};
counter20 = 0; counter21 = 0;
positivityRate20 = zeros(9,1); positivityRate21 = zeros(9,1);

for i = 1:len
    for j = 1:9
        if (strcmp([data.year_week{i}], weeks2020(j)) &&...
           strcmp([data.level{i}],'national') &&...
           strcmp([data.country_code{i}],countryCode))
            counter20 = counter20 + 1;
            positivityRate20(counter20) = data.positivity_rate(i);
        end
    
        if (strcmp([data.year_week{i}], weeks2021(j)) &&...
           strcmp([data.level{i}],'national') &&...
           strcmp([data.country_code{i}],countryCode))
            counter21 = counter21 + 1;
            positivityRate21(counter21) = data.positivity_rate(i);
       end
    end
end
end


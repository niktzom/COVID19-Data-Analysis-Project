%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% I consider easier to take all the data from the 'ECDC-7Days-Testing.xlsx'
% file as it has the weekly positivity rate for Greece already measured and
% we dont need to do that again using the 'FullEodyData.xlsx' file.


function [positivityRateEU,positivityRateGR,diff] = Group9Exe3Fun1(AnyWeek)
%GROUP9EXE3FUN1 
%   This function takes a year and week input and returns the positivity
%   rates of the 25 EU countries and of Greece in that particular week as
%   well as the difference between them.

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);
%pos_rate = zeros(25,1);
counter = 0;
positivityRateEU = 0; positivityRateGR = 0;

for i = 1:len
    % positivity rate for EU
   if (strcmp([data.year_week{i}], AnyWeek) &&...
           strcmp([data.level{i}],'national') &&...
            ~strcmp([data.country_code{i}],'LI') && ... 
           ~strcmp([data.country_code{i}],'LU') && ...
           ~strcmp([data.country_code{i}],'RO') && ...
           ~strcmp([data.country_code{i}],'EL') && ...
           ~strcmp([data.country_code{i}],'MT'))
       counter = counter + 1;
       posit = data.positivity_rate(i);
       positivityRateEU = positivityRateEU + posit;
   end
   
     % positivity rate for GR
   if (strcmp([data.year_week{i}], AnyWeek) &&...
           strcmp([data.level{i}],'national') &&...
           strcmp([data.country_code{i}],'EL'))
        positivityRateGR = data.positivity_rate(i);
   end
end
positivityRateEU = positivityRateEU / counter;

diff = positivityRateEU - positivityRateGR; 

end


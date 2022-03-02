%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [positivity] = Group9Exe1Fun2(year_and_week)
%GROUP9EXE1FUN0 
% This function takes a year and week input and returns a table with the
% positivity rate for each country on that particular week of the year.
% Data in subnational level are ignored as well as data from
% Greece,Luxembourg,Liechtenstein,Malta and Romania.

data = readtable('ECDC-7Days-Testing.xlsx');
len = height(data);
pos_rate = zeros(25,1);
counter = 0;

for i = 1:len
   if (strcmp([data.year_week{i}], year_and_week) &&...
           strcmp([data.level{i}],'national') &&...
            ~strcmp([data.country_code{i}],'LI') && ... 
           ~strcmp([data.country_code{i}],'LU') && ...
           ~strcmp([data.country_code{i}],'RO') && ...
           ~strcmp([data.country_code{i}],'EL') && ...
           ~strcmp([data.country_code{i}],'MT'))
       counter = counter + 1;
       posit = data.positivity_rate(i);
       pos_rate(counter,1) = posit;
   end
end
positivity = pos_rate;
positivity = nonzeros(positivity);
end


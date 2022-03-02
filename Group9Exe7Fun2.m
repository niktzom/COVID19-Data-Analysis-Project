%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [year_week,deathsPer1M] = Group9Exe7Fun2
%GROUP9EXE7FUN2 
% Create a table for Hungary with each week  from ECDC-7Days-Testing file 
% and its corresponding number of COVID deaths per 1 million inhabitants.

% year and week from 'ECDC-7Days-Testing' file
year_week = {'2020-W13';'2020-W14';'2020-W15';...
'2020-W16';'2020-W17';'2020-W18';'2020-W19';'2020-W20';'2020-W21';'2020-W22';...
'2020-W23';'2020-W24';'2020-W25';'2020-W26';'2020-W27';'2020-W28';'2020-W29';...
'2020-W30';'2020-W31';'2020-W32';'2020-W33';'2020-W34';'2020-W35';'2020-W36';...
'2020-W37';'2020-W38';'2020-W39';'2020-W40';'2020-W41';'2020-W42';'2020-W43';...
'2020-W44';'2020-W45';'2020-W46';'2020-W47';'2020-W48';'2020-W51';'2020-W52';...
'2020-W53';'2021-W01';'2021-W02';'2021-W03';'2021-W04';'2021-W05';'2021-W06';...
'2021-W07';'2021-W08';'2021-W09';'2021-W10';'2021-W11';'2021-W12';'2021-W13';...
'2021-W14';'2021-W15';'2021-W16';'2021-W17';'2021-W18';'2021-W19';'2021-W20';...
'2021-W21';'2021-W22';'2021-W23';'2021-W24';'2021-W25';'2021-W26';'2021-W27';...
'2021-W28';'2021-W29';'2021-W30';'2021-W31';'2021-W32';'2021-W33';'2021-W34';...
'2021-W35';'2021-W36';'2021-W37';'2021-W38';'2021-W39';'2021-W40';'2021-W41';...
'2021-W42';'2021-W43';'2021-W44';'2021-W45';'2021-W46';'2021-W47';'2021-W48';...
'2021-W49';'2021-W50'};

% Covid deaths per 1 million inhabitants of Hungary taken from 
% 'https://www.stelios67pi.eu/testing.html' website. The data is about the
% span from 2020-W13 to 2021-W50 with weeks 49 and 50 from 2020 missing as
% we dont have their weekly data from ECDC file.
deathsPer1M = [1 3 7 9 8 7 7 4 3 4 2 1 0 1 0 0 0 0 1 1 0 1 0 1 2 5 7 10 13 ...
    22 33 50 72 76 67 87 114 105 94 80 72 61 54 52 51 56 78 97 128 159 190 ...
    192 159 127 96 71 52 35 23 12 9 5 3 3 1 1 1 0  1 1 0 1 1 2 3 4 5 7 7 12 ...
    21 40 67 89 101 125 135 125 102]';

% weeks_deaths = table(year_week,deathsPer1M);
end


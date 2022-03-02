%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [weekspan,deathSpan] = Group9Exe7Fun3(weekInput,delay)
%GROUP9EXE7FUN3
% This function will take a certain week and the delay of weeks prior to it 
% and will return a 16-week span cell. 

[weekData,deaths] = Group9Exe7Fun2(); 

idx = find(strcmp(weekData,weekInput)); %finding the index of the week with the spike.

%%%%%%
msg = 'Input must be after 2020-W28 in order to have a 4 month span. Change input week!';
if idx-16 < 0 
    error(msg)
end
%%%%%%    
% creating a new weekspan with a certain delay of weeks
weekspan = weekData(idx - delay - 15 : idx - delay);
deathSpan = deaths(idx - delay - 15 : idx - delay);
end


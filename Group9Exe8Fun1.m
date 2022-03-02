function positivityRateGR = Group9Exe8Fun1(finalDay,totalDays)
%GROUP9EXE8FUN1 
%
% Create a table with a 30 day span where the 1st column is the daily new
% cases, 2nd column represents the daily PCR test and 3rd the daily Rapid
% tests. 2nd and 3rd columns are created with the subtraction of two back
% two back days because are data is total PCR test done until day X.
% Return the positivity Rate of Greece for that span from dividing column 1
% to the sum of columns 2 and 3.


data = readtable('FullEodyData.xlsx','PreserveVariableNames',true);

startingDay = finalDay - totalDays;

days = data(startingDay:finalDay,{'NewCases','PCR_Tests','Rapid_Tests'});
    
newCases = days.NewCases;    
PCRTests= days.PCR_Tests;    
rapidTests = days.Rapid_Tests;

% previousPCR = PCRTests(1); 
% previousRapid = rapidTests(1);
previousPCR = table2array(data(startingDay-1,{'PCR_Tests'}));
previousRapid = table2array(data(startingDay-1,{'Rapid_Tests'}));

dailyPCRs = zeros(totalDays-1,1); dailyRapids = zeros(totalDays-1,1);

for i = 1:totalDays
    
    dailyPCRs(i) = (PCRTests(i+1) - PCRTests(i));
    dailyRapids(i) = (rapidTests(i+1) - rapidTests(i)); 
end

dailyPCRs = [PCRTests(1)-previousPCR; dailyPCRs];
dailyRapids = [rapidTests(1)-previousRapid; dailyRapids];


data30DaySpan = [newCases dailyPCRs dailyRapids];

L = length(data30DaySpan);
positivityRateGR = zeros(1,L);

positivityRateGR(1,:) = data30DaySpan(:,1)./(data30DaySpan(:,2) + data30DaySpan(:,3)); 

end


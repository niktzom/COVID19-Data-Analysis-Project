%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Group9Exe7Fun5(mdlSpan)
%GROUP9EXE7FUN5 
% Function to create a table with the linear regression model data and
% display it.

data = [1 mdlSpan{1}.Rsquared.Ordinary mdlSpan{1}.Rsquared.Adjusted mdlSpan{1}.RMSE;
    2 mdlSpan{2}.Rsquared.Ordinary mdlSpan{2}.Rsquared.Adjusted mdlSpan{2}.RMSE;
    3 mdlSpan{3}.Rsquared.Ordinary mdlSpan{3}.Rsquared.Adjusted mdlSpan{3}.RMSE;
    4 mdlSpan{4}.Rsquared.Ordinary mdlSpan{4}.Rsquared.Adjusted mdlSpan{4}.RMSE;
    5 mdlSpan{5}.Rsquared.Ordinary mdlSpan{5}.Rsquared.Adjusted mdlSpan{5}.RMSE];

VarNames = {'Weeks Delay','Rsquared','adjRsquared','RMSE'};
T = table(data(:,1),data(:,2),data(:,3),data(:,4), 'VariableNames',VarNames);

disp(T)
end


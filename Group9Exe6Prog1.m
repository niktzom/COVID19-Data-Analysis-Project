%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Our country A (only for  this problem) is Greece. Based on problem 5
% we know that the two biggest correlation coefficients between Greece
% and the other five European countries are with Hungary(r = 0.8320) and
% with Ireland(r = 0.7635). So for problem 6 country B will be Hungary and
% Ireland will be country C.

% First we use Exe5Fun1 to take the positivity rates of the 3 countries
% again in the 13 week span (W38-W50).

clear; clc; close all;

b = 1000; alpha = 0.05; flag = 0;
positivityHU = Group9Exe5Fun1('HU');  B = positivityHU;
positivityIR = Group9Exe5Fun1('IE');  C = positivityIR;
positivityGR = Group9Exe5Fun1('EL');  A = positivityGR;


bootHU = bootstrp(b,@corr,A,B);
bootIR = bootstrp(b,@corr,A,C);

% The difference between the bootstrapped correlation coefficients is shown
% in the below histograms.
figure()
h1 = histfit(bootHU);
hold on;
set(h1(1),'FaceColor','#00035b');
h2 = histfit(bootIR);
set(h2(1),'facealpha',0.5)
legend('Bootstrapped corr Hungary','','Bootstrapped corr Ireland',...
    'Location','northwest');

% The correlation coefficients again using the function already made in
% problem number 5.
[pearsonHU,~,~] = Group9Exe5Fun2(positivityHU,positivityGR);
[pearsonIR,~,~] = Group9Exe5Fun2(positivityIR,positivityGR);

% Checkiing if the correlation coefficients are equal using p-value.
lowerLim = (b+1)*alpha/2;
upperLim = b+1-lowerLim;
limits = [lowerLim upperLim]/b*100;
limits(1) = ceil(limits(1));
limits(2) = floor(limits(2));

diff = bootHU - bootIR;
stat = pearsonHU - pearsonIR;
bootCorrDiff = [diff; stat];
bootCorrDiff = sort(bootCorrDiff);
rankCorr = find(bootCorrDiff==stat);

fprintf(['Bootstrap check for significance difference between the 2 '...
 'correlation coefficients\n'])
if( rankCorr < limits(1) || rankCorr > limits(2) )
    fprintf('\n-- Equal hypothesis between correalation coefficients rejected --');
else
    fprintf('\n-- Equal hypothesis between correalation coefficients accepted --');
end

%% Conclusion
% From the histograms and the bootstrap checking we conclude that the 2
% correlation coefficients are not equal.
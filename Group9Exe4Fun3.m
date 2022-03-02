%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Group9Exe4Fun3(ciCC1,ciCC2,ciCC3,ciCC4,ciCC5,method)
%GROUP9EXE4FUN3
% Plotting the CI intervals of the parametric and bootstrap test for each
% country.

figure
%country 1
line([0 ,2], [ciCC1(1),ciCC1(1)],'LineWidth',1.5,'LineStyle','-.','Color','r')
hold on;
line([0 ,2], [ciCC1(2),ciCC1(2)],'LineWidth',1.5,'LineStyle','-.','Color','r')
hold on;
%country 2
line([0 ,2], [ciCC2(1),ciCC2(1)],'LineWidth',1.5,'LineStyle','-','Color','b')
hold on;
line([0 ,2], [ciCC2(2),ciCC2(2)],'LineWidth',1.5,'LineStyle','-','Color','b')
hold on;
%country 3
line([0 ,2], [ciCC3(1),ciCC3(1)],'LineWidth',1.5,'LineStyle',':','Color','y')
hold on;
line([0 ,2], [ciCC3(2),ciCC3(2)],'LineWidth',1.5,'LineStyle',':','Color','y')
hold on;
%country 4
line([0 ,2], [ciCC4(1),ciCC4(1)],'LineWidth',1.5,'LineStyle',':','Color','g')
hold on;
line([0 ,2], [ciCC4(2),ciCC4(2)],'LineWidth',1.5,'LineStyle',':','Color','g')
hold on;
%country 5
line([0 ,2], [ciCC5(1),ciCC5(1)],'LineWidth',1.5,'LineStyle','--','Color','m')
hold on;
line([0 ,2], [ciCC5(2),ciCC5(2)],'LineWidth',1.5,'LineStyle','--','Color','m')
hold on;
title(method);
legend('Germany','','Hungary','','Iceland','','Ireland','','Italy');

end


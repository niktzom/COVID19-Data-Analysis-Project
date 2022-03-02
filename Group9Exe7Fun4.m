%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Group9Exe7Fun4(deathSpan,positivityRate,span)
%GROUP9EXE7FUN4 
% Function to create the a figure with subplots of scatter charts for
% deaths per 1 million inhabitants and positivity rate of Hungary. This
% will be done in different 4-week spans and with different delays of 1 to
% 5 weeks.

txt = sprintf('Scatter plots of deaths to positivity rate of Hungary. Week span: %d',span);
r1 = corrcoef(deathSpan(:,1),positivityRate(:,1)); anno_txt1 = sprintf('r = %.3f',r1(1,2));
r2 = corrcoef(deathSpan(:,2),positivityRate(:,2)); anno_txt2 = sprintf('r = %.3f',r2(1,2));
r3 = corrcoef(deathSpan(:,3),positivityRate(:,3)); anno_txt3 = sprintf('r = %.3f',r3(1,2));
r4 = corrcoef(deathSpan(:,4),positivityRate(:,4)); anno_txt4 = sprintf('r = %.3f',r4(1,2));
r5 = corrcoef(deathSpan(:,5),positivityRate(:,5)); anno_txt5 = sprintf('r = %.3f',r5(1,2));


figure('Name',txt)
% delay of 1 week
a1 = subplot(3,2,1);
scatter(deathSpan(:,1),positivityRate(:,1));
title('Scatter Plot for delay of 1 week');
xlabel('Deaths per 1 million'); ylabel('Positivity Rate');
annotation('textbox', [0.8, 0.2, 0.1, 0.1],'String',anno_txt1,'Position',a1.Position,'vert','top')
% delay of 2 weeks
a2 = subplot(3,2,2);
scatter(deathSpan(:,2),positivityRate(:,2));
title('Scatter Plot for delay of 2 weeks');
xlabel('Deaths per 1 million'); ylabel('Positivity Rate');
annotation('textbox', [0.8, 0.2, 0.1, 0.1], 'String',anno_txt2,'Position',a2.Position,'vert','top')
% delay of 3 weeks
a3 = subplot(3,2,3);
scatter(deathSpan(:,3),positivityRate(:,3));
title('Scatter Plot for delay of 3 weeks');
xlabel('Deaths per 1 million'); ylabel('Positivity Rate');
annotation('textbox', [0.8, 0.2, 0.1, 0.1], 'String',anno_txt3,'Position',a3.Position,'vert','top')
% delay of 4 weeks
a4 = subplot(3,2,4);
scatter(deathSpan(:,4),positivityRate(:,4));
title('Scatter Plot for delay of 4 weeks');
xlabel('Deaths per 1 million'); ylabel('Positivity Rate');
annotation('textbox', [0.8, 0.2, 0.1, 0.1], 'String',anno_txt4,'Position',a4.Position,'vert','top')
% delay of 5 weeks
a5 = subplot(3,2,5.5);
scatter(deathSpan(:,5),positivityRate(:,5));
title('Scatter Plot for delay of 5 weeks');
xlabel('Deaths per 1 million'); ylabel('Positivity Rate');
annotation('textbox', [0.8, 0.2, 0.1, 0.1], 'String',anno_txt5,'Position',a5.Position,'vert','top')


end


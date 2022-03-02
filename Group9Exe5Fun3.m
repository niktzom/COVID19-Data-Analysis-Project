%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data Analysis Auth
% Project 2021-2022
% Tzomidis Nikolaos-Fotios (9461) 
% tzomidis@ece.auth.gr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Null Hypothesis Testing

function [t0,t] = Group9Exe5Fun3(mean,sigma,size,L)
samples = mvnrnd(mean,sigma,size);
r = corrcoef(samples);
r = r(1,2);
t0 = r*sqrt((size-2)/(1-r^2));
t = zeros(L,1);
for i = 1:L
    for j = 1:2
        perm = randperm(size);
        samples(:,j) = samples(perm);
    end
    r2 = corrcoef(samples);
    r2 = r2(1,2);
    t(i) = r2*sqrt( (size-2)/(1-r2^2) );
end
end


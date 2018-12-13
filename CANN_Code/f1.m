% Function f1.m:

function f1=rnn1(u)
% gain function: logistic 
beta =.1; alpha=0;
f1=1./(1+exp(-beta.*(u-alpha))); 
return

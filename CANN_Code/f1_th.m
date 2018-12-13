% Function f1.m:

function u=rnn1(u)
% gain function: logistic 
u(find(u>-37)) = 1;
u(find(u<-37)) = 0;
return

%Function rnn_ode_u.m:

function udot=rnn_ode_u(t,u,flag,nn,dx,w,I_ext)
% odefile for recurrent network
tau_inv = 1./1;	% inverse of membrane time constant 
r=f1(u);
sum=w*r*dx+I_ext; udot=tau_inv*(-u+sum+I_ext)
return
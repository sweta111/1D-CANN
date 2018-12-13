%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1-d Continuous Attractor Neural Network with Hebbian learning%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; hold on;
nn = 100; dx=2*pi/nn; % number of nodes and resolution in deg

k = 1;
umax = zeros(size(0.2:0.1:0.5));
for C = 0.2:0.1:0.5
%weight matrices 
sig = 2*pi/40;
w_sym=hebb(nn,sig,dx)/(sqrt(pi)*sig); 
% C=0.2;
Aw=70;
w=Aw*(w_sym-C);                            

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%	Experiment	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1%%% external input to initiate bubble 
u0 = zeros(nn,1);
I_ext=zeros(nn,1); 

for i=-5:5; I_ext(nn/2+i)=10; end 
param=0;
tspan=[0,10]; 
[t,u]=ode45('rnn_ode_u',tspan,u0,[],nn,dx,w,I_ext); r=f1(u);
% t is the value of the independent variable at which the solution array u is calculated.
% This vector is not necessarily equal to tspan above because ode45 does
% some amount of playing about with step sizes to maximize both accuracy and efficiency
% (taking smaller steps where the problem changes rapidly and larger steps
% where it’s relatively constant). The length of t however is the same as that of
% tspan

% u is an array (or matrix) with size length(t) by
% length(u0). Each column of u is a different dependent variable.
surf(t',1:nn,r','linestyle','none'); colorbar; view(0,90);
%2%%% no external input to equilibrate 
u0 = u(size(t,1),:); I_ext=zeros(nn,1);
param=0; tspan=[10,200];
[t,u]=ode45('rnn_ode_u',tspan,u0,[],nn,dx,w,I_ext); r=f1(u);
 %figure(2);
surf(t',1:nn,r','linestyle','none');view(0,90);colorbar
pause(0);

temp = max(r);
umax(1,k) = temp(nn/2);
k = k + 1;
end

figure(2);
plot(0.2:0.1:0.5,umax,'-or');
xlabel('C');
ylabel('umax');
% ylim([0,10]);




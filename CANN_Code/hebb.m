%Function hebb.m:

function w = hebb(nn,sig,dx)
% self organization of symmetric cann interactions 
lrate=1;	% learning rate
w=zeros(nn);
%%%%%%% learning session 
for epoch=1:1
%w2(epoch,:)=w(50,:); 
for loc=1:nn;
r=in_signal_pbc(loc*dx,1,sig,nn,dx); dw=lrate.*r*r';
w=w+dw;
end
end 
w=w*dx; return
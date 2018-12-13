% Function in_signal_pbc.m:

function y = in_signal_pbc(loc,ampl,sig,nn,dx) 
y=zeros(nn,1);
for i=1:nn;
di=min(abs(i*dx-loc),2*pi-abs(i*dx-loc)); 
y(i)=ampl*exp(-di^2/(2*sig^2));
end
return
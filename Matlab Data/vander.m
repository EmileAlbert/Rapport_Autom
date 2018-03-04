function hv = vander(k,tu,tg,a)
T1 = tg*((3*a*exp(1)-1)/(1+a*exp(1)));
T2 = tg*((1-a*exp(1))/(1+a*exp(1)));
Tm = tu - ((T1*T2)/(T1+3*T2));
s = tf('s');
hv = (k*exp(-s*Tm))/((s*T1+1)*(s*T2+1));
end
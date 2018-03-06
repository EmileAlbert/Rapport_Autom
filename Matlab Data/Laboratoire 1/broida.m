function hb = broida(k,t1,t2)
s = tf('s');
T = 5.5*(t2-t1);
Tm = (2.8*t1-1.8*t2); 
hb = (k*exp(-s*Tm))/(s*T+1);
end

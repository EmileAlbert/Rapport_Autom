function hv = strejc(k,tu,tg,a)
if (tu/tg) > 0.49
    n = 6;
    T = tg/5.7;
elseif (tu/tg) > 0.41
    n = 5;
    T = tg/5.12;
elseif (tu/tg) > 0.32
    n = 4;
    T = tg/4.46;
elseif (tu/tg) > 0.22
    n = 3;
    T = tg/3.69;
elseif (tu/tg) > 0.104
    n = 2;
    T = tg/2.72;
else
    n = 1;
    T = tg;
end    
T1 = tg*((3*a*exp(1)-1)/(1+a*exp(1)));
T2 = tg*((1-a*exp(1))/(1+a*exp(1)));
Tm = tu - ((T1*T2)/(T1+3*T2));
s = tf('s');
hv = (k*exp(-s*Tm))/(((s*T)+1)^n);
fprintf('n value for Strejc= %f\n', n);  % Method 1
end
function a = bodeOfG0(Kp,Ti,Td,v)
figure
s = tf('s');
Hvdg = (0.98*exp(-s*14.97))/((s*14.74+1)*(s*7.12+1));
Tf = Td/v;
R = Kp*(((1+s*Ti)/s*Ti)*((s*Td+1)/(s*Tf+1)));
G0 = Hvdg*R;
[Am,OmegaA,phi,Omegaphi] = margin(G0);
%logspace(a,b) -> logarithmic space between 10^a and 10^b
w = logspace(-2, 3);
bode(G0,w);
formatAm = 'Am = %f';
formatOmegaA = 'Omega Am = %f rad/s';
formatphi = 'Phi = %f';
formatOmegaphi = 'OmegaPhi = %f rad/s';
title({sprintf(formatAm,Am),sprintf(formatOmegaA,OmegaA),sprintf(formatphi,phi),sprintf(formatOmegaphi,Omegaphi)});
grid on
end


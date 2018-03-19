Kp = 4.118 * 1.5;
Ti = 145.83;
Td = 15.622;
v = 15;
close all
bodeOfG0(0.66 * Kp,Ti,Td,v, 'bode-0');
bodeOfG0(Kp,Ti,Td,v, 'bode-1');
%bodeOfG0(0.5*Kp,Ti,Td,v, 'bode-2');
bodeOfG0(Kp,100000,Td,v, 'bode-3');
bodeOfG0(Kp,100000,0.001,v, 'bode-4');
bodeOfG0(0.5*Kp,100000,0.001,v, 'bode-5');
bodeOfG0(Kp,Ti,2*Td,v, 'bode-6');
bodeOfG0(Kp,Ti,4*Td,v, 'bode-7');
bodeOfG0(8*Kp,100000,0.001,v, 'bode-8');

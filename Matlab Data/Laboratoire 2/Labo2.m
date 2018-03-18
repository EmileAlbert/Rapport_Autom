Kp = 4.118;
Ti = 145.83;
Td = 15.622;
v = 15;
close all
bodeOfG0(Kp,Ti,Td,v);
bodeOfG0(1.5*Kp,Ti,Td,v);
bodeOfG0(0.5*Kp,Ti,Td,v);
bodeOfG0(Kp,100000,Td,v);
bodeOfG0(Kp,100000,0.001,v);
bodeOfG0(0.5*Kp,100000,0.001,v);
bodeOfG0(Kp,Ti,2*Td,v);
bodeOfG0(Kp,Ti,4*Td,v);
bodeOfG0(8*Kp,100000,0.001,v);

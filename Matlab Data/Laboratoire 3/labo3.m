H1.KP = 0.81;
H1.T1 = 86.16;
H1.T2 = 10.18;
H1.Tm = 14.16;
H2.KP = -0.401;
H2.T1 = 100.676;
H2.T2 = 1.26e-09;
H2.Tm = 19.61;
H2.j = 0.0503;
s = tf('s');
H1.G0 = (H1.KP*exp(-s*H1.Tm))/((s*H1.T1+1)*(s*H1.T2+1))
H2.G0 = (H2.KP*exp(-s*H2.Tm))/((s*H2.T1+1)*(s*H2.T2+1))
H1.G0
H2.G0
diff = H2.Tm - H1.Tm
rapp = -H2.KP/H1.KP

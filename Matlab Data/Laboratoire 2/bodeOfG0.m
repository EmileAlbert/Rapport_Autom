function a = bodeOfG0(Kp,Ti,Td,v, name)
    figure('rend','painters','pos',[10 10 1200 700])
    s = tf('s');
    
    Kv = 0.98;
    Tm = 14.97;
    T1 = 14.74;
    T2 = 7.12;
    
    Hvdg = (Kv * exp(-s * Tm)) / ((s * T1 + 1)*(s * T2 + 1));
    
    Tf = 1; %Td / v;
    
    R = Kp * (((1+s*Ti)/s*Ti) * ((s*Td+1)/(s*Tf+1)));
    
    G0 = Hvdg*R;
    
    [Gm,Pm,Wgm,Wpm] = margin(G0);
    %margin(G0);
    %pause;
    %logspace(a,b) -> logarithmic space between 10^a and 10^b
    w = logspace(-2, 2);
    
    %[~, phase, wout] = bode(G0);
    %limit360 = find(phase <= -360);
    %w360 = log10(wout(limit360(1)))
    %w360 = find(wout >= max(Wgm, Wpm), 1)
    
    %w = logspace(-2, w360);
    
    bode(G0, w);
    formatGm = 'Gm = %f dB (à %f rad/s)';
    formatPm = 'Pm = %f deg (à %f rad/s)';
    title({sprintf(formatGm, Gm, Wgm), sprintf(formatPm, Pm, Wpm)});
    grid on
    print(name, '-dpng');
end


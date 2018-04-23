%% print dos dispositivos que existem:
daq.getDevices



%% criar sessoes

s1 = daq.createSession( 'ni')
s.Rate = Fs;
s.DurationInSeconds = L/Fs
s.addAnalogInputChannel('Dev1','ai0','Voltage');

S = startForeground(s);



size(transverse(S(:,1))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%   situações
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% situação 1


fig1 = subplot(2,1,1);

plot(1)
title(fig1, 







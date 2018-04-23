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

% sinusoide com amplitude 2V  freq = 2.5kHz  ; 
N = 400 ; 
Fs = 50e3;



s1 = daq.createSession( 'ni');
s1.addAnalogInputChannel('Dev1','ai0','Voltage');
s1.Rate = Fs;
s1.DurationInSeconds = N / fs;

S = startForeground(s1);

[ freqest, valef, valmed, freqs, ssps ] = signalinfo( valores , fs )

plot(s1);



fig1 = subplot(2,1,1);

plot(1)
title(fig1, {'Situação 1 - ';'Freq estimada ';  sprintf('%f',freqest); sprintf('%f',freqest); '; Va' });









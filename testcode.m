

N = 100;
fs = 100;
t = [0:1/fs:N*(1/fs)];
a =  3*sin(2*10*pi*t) + 5*sin(2*15*pi*t);
subplot(2,1,1);
plot(t,a);
[ freqest, valef, valmed, freqs, ssps ] = signalinfo(a, fs);

disp(valef);
disp(valmed);
disp(freqest);

subplot(2,1,2);
plot(freqs, ssps,'.-');

figure
plot(freqs, 20*log10(ssps),'.-');


%% 

N = 100;
fs = 100;
t = [0:1/fs:N*(1/fs)];
a =  3*sin(2*10*pi*t);
b =  3*sin(2*10*pi*t + pi/2);

phasefinder(a,b,10, fs)
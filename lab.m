

%session = daq.createSession

ai = analoginput('nidaq','Dev1');

chans = addchannel(ai,0:1);

%save('example.mat')
%load('example.mat')

%% Definir frequência de aquisição
 
freqDeAquisicao = 10e3  % é a frequencia de aquisição de cada canal 
                        % individualmente

% ai.SampleRate = freqDeAquisicao % aplica-se a todos os canais ao mesmo 
% tempo, se houver mais que 1
frequenciaReal = setverify(ai,'SampleRate', freqDeAquisicao); % permite garantir que a linha anterior comentada está bem
disp(freqDeAquisicao)

%%

actualduration= ai.SamplesPerTrigger / ai.SampleRate
start(ai)
wait(ai, actualduration + 1)

data = getdata(ai)
da
% data é uma matriz m * n onde n, o número de colunas, coresponde ao número
% de canais e m corresponde ao número de pontos adquiridos




%%

delete(ai)
clear ai




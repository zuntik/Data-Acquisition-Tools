function [ phasediff ] = phasefinder( dados1, dados2, freq, fs )
% devolve a diferença de fase entre 2 sinusoides
%   Detailed explanation goes here

[ a, N ]  = size(dados1);
if a ~= 1
    disp('dados 1 ou 2 inválidos')
    return
end

% resolução de frequência:
fresol = fs / N;

m = round( freq / fresol );

sm1 = 0;
sm2 = 0;
for n = 1:N
    sm1 = sm1 + dados1(n) * exp(-2*j*pi*(n-1)*(m-1)/N);
    sm2 = sm2 + dados2(n) * exp(-2*j*pi*(n-1)*(m-1)/N);
end    

phasediff = angle(sm1)- angle(sm2);

end


function [ freqest, valef, valmed, freqs, ssps ] = signalinfo( valores , fs )
% devolve informação básica de um conjunto de valores obetidos por um
% sistema de aquisição de sinais
%  saída
%   freqest - frequência prevista
%   valef - valor eficaz
%   valmed - valor medio
%   freqs - frequências correspondentes ao valores da ssps
%   ssps - valores para a single sided power spectrum
%  entrada
%   valores - matriz 1:n 


[ a, N ]  = size(valores);
if a ~= 1
    disp('valores has more than one line')
    return
end

% resolução de frequência:
fresol = fs / N;


for m = 1:N/2
    freqs(m)=(m-1)*fresol;
end

% S é  a matriz dos valores da dft
% cuidado com a indexação, que não começa em 0
for m = 1:N
    S(m)=0;
    for n = 1:N
        S(m) = S(m) + valores(n) * exp(-2*j*pi*(n-1)*(m-1)/N);
    end
end

% S contém os valores certos, mas é sempre necessário descontar 1 ao
% índice, por exemplo: S(1) é na realizade S0

dsps = (abs(S)/N).^2; % double sided
ssps(1) = dsps(1);
ssps(2:N/2) = 2*dsps(2:N/2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%   estimativa da frequência
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[maxvalue, index] = max(ssps);


%{
if index < 3
    freqest=(index-1)*fresol;
else 
    numerador = 0;
    denominador = 0;
    for m = index-3 : index+3
        numerador = numerador + ssps(m)*(m-1)*fresol;
        denominador = denominador + ssps(m)*(m-1);
    end
    freqest = ( numerador ) /  ( denominador  );
end
%}

freqest=(index-1)*fresol;


% não esquecer melhorar a estimativa para algoritmo melhor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  estimativa do valor medio e eficaz
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nptspper = fs/freqest;
npers = N / nptspper;
npers = floor(npers);
Navg = round(npers*nptspper);

valmed = (1/Navg) * sum(valores(:,1:Navg));

valef = sqrt( (1/Navg) * sum( valores(:,1:Navg).^2 ) );

end


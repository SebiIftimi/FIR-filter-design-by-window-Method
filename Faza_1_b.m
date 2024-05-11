M = 25; % Duration of the windows (the same for all 9 windows)
r = 89.6757; % Attenuation of the side/parasitic lobes of the Chebyshev window's spectrum;
beta = 5.8703; % Height of the first side/parasitic lobe of the Kaiser window's spectrum;
L = 3; % Aperture of the Lanczos window; an integer between 2 and 7;
alfa = 49.0270; % Percentage of the constant part of the Tukey window; varies between 20% and 80%.

%% Amplitudes of the frequency responses of the windows

% Rectangular Window
w1 = boxcar(M);
w1 = w1/sum(w1); % Normalization
[W1,om1] = freqz(w1,1,5000,'whole');
W1 = 20*log10(abs(W1));
figure;
plot(om1/pi, W1);
title('Amplitude of the Rectangular Window')
xlabel('Amplitude');
ylabel('Magnitude (dB)');

%%
% Triangular Window
w2 = tukeywin(M);
w2 = w2/sum(w2); % Normalization
[W2,om2] = freqz(w2,1,5000,'whole');
W2 = 20*log10(abs(W2));
figure
subplot(2,2,1);
plot(om2/pi, W2);
title('Triangular Window');
%%
% Blackman Window
w3 = blackman(M);
w3 = w3/sum(w3); % Normalization
[W3,om3] = freqz(w3,1,5000,'whole');
W3 = 20*log10(abs(W3));
subplot(2,2,2);
plot(om3/pi, W3);
title(' Blackman Window');

% Hamming Window
w4 = hamming(M);
w4 = w4/sum(w4); % Normalization
[W4,om4] = freqz(w4,1,5000,'whole');
W4 = 20*log10(abs(W4));
subplot(2,2,3);
plot(om4/pi, W4);
title(' Hamming Window');

% Hanning Window
w5 = hamming(M);
w5 = w5/sum(w5); % Normalization
[W5,om5] = freqz(w5,1,5000,'whole');
W5 = 20*log10(abs(W5));
subplot(2,2,4);
plot(om5/pi, W5);
title('Hanning Window');

%%
% Cebîşev Window r = 89.6757
w6_1 = chebwin(M,r);
w6_1 = w6_1/sum(w6_1);
[W6_1,om6_1] = freqz(w6_1,1, 5000, 'whole');
W6_1 = 20*log10(abs(W6_1));
figure
subplot(2,3,1);
plot(om6_1/pi, W6_1 );
title('Cebîșev r = 89.6757');

% Cebîşev Window r = 84.6757
r1 = r - 5;
w6_2 = chebwin(M,r1);
w6_2 = w6_2/sum(w6_2);
[W6_2,om6_2] = freqz(w6_2,1, 5000, 'whole');
W6_2 = 20*log10(abs(W6_2));
subplot(2,3,2);
plot(om6_2/pi, W6_2 );
title('Cebîșev r = 84.6757');

% Cebîşev Window r = 94.6757
r2 = r + 5;
w6_3 = chebwin(M,r2);
w6_3 = w6_3/sum(w6_3);
[W6_3,om6_3] = freqz(w6_3,1, 5000, 'whole');
W6_3 = 20*log10(abs(W6_3));
subplot(2,3,3);
plot(om6_3/pi, W6_3 );
title('Cebîșev r = 94.6757');

% Kaiser Window beta = 5.8703
w7_1 = kaiser(M, beta);
w7_1 = w7_1/sum(w7_1);
[W7_1,om7_1] = freqz(w7_1,1, 5000, 'whole');
W7_1 = 20*log10(abs(W7_1));
subplot(2,3,4);
plot(om7_1/pi, W7_1);
title('Kaiser beta = 5.8703');

% Kaiser Window beta = 4.8703
beta1 = beta - 1;
w7_2 = kaiser(M, beta1);
w7_2 = w7_2/sum(w7_2);
[W7_2,om7_2] = freqz(w7_2,1, 5000, 'whole');
W7_2 = 20*log10(abs(W7_2));
subplot(2,3,5);
plot(om7_2/pi, W7_2);
title('Kaiser beta = 4.8703');

% Kaiser Window beta = 6.8703
beta2 = beta + 1;
w7_2 = kaiser(M, beta2);
w7_2 = w7_2/sum(w7_2);
[W7_2,om7_2] = freqz(w7_2,1, 5000, 'whole');
W7_2 = 20*log10(abs(W7_2));
subplot(2,3,6);
plot(om7_2/pi, W7_2);
title('Kaiser beta = 6.8703');

%%

% Lanczos Window L = 3
w8_1 = lanczos_window(M,L);
w8_1 = w8_1/sum(w8_1);
[W8_1,om8_1] = freqz(w8_1,1, 5000, 'whole');
W8_1 = 20*log10(abs(W8_1));
figure
subplot(2,3,1);
plot(om8_1/pi, W8_1);
title('Kaiser L = 3');

% Lanczos Window L = 2
L1 = L - 1;
w8_2 = lanczos_window(M,L1);
w8_2 = w8_2/sum(w8_2);
[W8_2,om8_2] = freqz(w8_2,1, 5000, 'whole');
W8_2 = 20*log10(abs(W8_2));
subplot(2,3,2);
plot(om8_2/pi, W8_2);
title('Kaiser L = 2');

% Lanczos Window L = 4
L2 = L + 1;
w8_3 = lanczos_window(M,L2);
w8_3 = w8_3/sum(w8_3);
[W8_3,om8_3] = freqz(w8_3,1, 5000, 'whole');
W8_3 = 20*log10(abs(W8_3));
subplot(2,3,3);
plot(om8_3/pi, W8_3);
title('Kaiser L = 4');

% Tukey Window alfa = 49.0270;
w9_1 = tukeywin(M,alfa/100);
w9_1 = w9_1/sum(w9_1);
[W9_1,om9_1] = freqz(w9_1,1, 5000, 'whole');
W9_1 = 20*log10(abs(W9_1));
subplot(2,3,4);
plot(om9_1/pi, W9_1);
title('Tukey alfa = 49.0270');

% Tukey Window alfa = 34.0270;
alfa1 = alfa - 15;
w9_2 = tukeywin(M,alfa1/100);
w9_2 = w9_2/sum(w9_2);
[W9_2,om9_2] = freqz(w9_2,1, 5000, 'whole');
W9_2 = 20*log10(abs(W9_2));
subplot(2,3,5);
plot(om9_2/pi, W9_2);
title('Tukey alfa = 34.0270');

% Tukey Window alfa = 34.0270;
alfa2 = alfa + 15;
w9_3 = tukeywin(M,alfa2/100);
w9_3 = w9_3/sum(w9_3);
[W9_3,om9_3] = freqz(w9_3,1, 5000, 'whole');
W9_3 = 20*log10(abs(W9_3));
subplot(2,3,6);
plot(om9_3/pi, W9_3);
title('Tukey alfa = 64.0270');








 

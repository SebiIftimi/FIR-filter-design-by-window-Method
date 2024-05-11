M = 25; % Duration of the windows (the same for all 9 windows)
r = 89.6757; % Attenuation of the side/parasitic lobes of the Chebyshev window's spectrum;
beta = 5.8703; % Height of the first side/parasitic lobe of the Kaiser window's spectrum;
L = 3; % Aperture of the Lanczos window; an integer between 2 and 7;
alfa = 49.0270; % Percentage of the constant part of the Tukey window; varies between 20% and 80%.

%%
% Impulse responses of the 9 windows using the stem function
% Rectangular Window
% w1 = boxcar(M);
% stem(0:M-1, w1);

%%
figure('Name','Impulse response (1) ');
% Triangular Window
w2 = triang(M);
subplot(2,2,1);
stem(0:M-1, w2);
ylim([0 1.5]);
title('Triangular Window');

% Blackman Window
w3 = blackman(M);
subplot(2,2,2);
stem(0:M-1, w3);
ylim([0 1.5]);
title(' Blackman Window');

% Hamming Window
w4 = hamming(M);
subplot(2,2,3);
stem(0:M-1, w4);
ylim([0 1.5]);
title('Hamming Window');

% Hanning Window
w5 = hanning(M);
subplot(2,2,4);
stem(0:M-1, w5);
ylim([0 1.5]);
title('Hanning Window');
%%

figure('Name','Impulse response (2) ');
% Cebîşev Window r = 89.6757
w6_1 = chebwin(M,r); 
subplot(2,3,1);
stem(0:M-1, w6_1);
ylim([0 1.5]);
title('Cebîșev r = 89.6757');
text(1, max(w6_1), sprintf('Attenuation: %.2f dB', r), 'HorizontalAlignment', 'left');

% Cebîşev Window r1 = r - 5 [dB]
r1 = r - 5;
w6_2 = chebwin(M,r1); 
subplot(2,3,2);
stem(0:M-1, w6_2);
ylim([0 1.5]);
title('Cebîșev r = 84.6757');
text(1, max(w6_2), sprintf('Attenuation: %.2f dB', r1), 'HorizontalAlignment', 'left' );

% Cebîşev Window r2 = r + 5 [dB]
r2 = r + 5;
w6_3 = chebwin(M,r2); 
subplot(2,3,3);
stem(0:M-1, w6_3);
ylim([0 1.5]);
title('Cebîșev r = 94.6757');
text(1, max(w6_3), sprintf('Attenuation: %.2f dB', r2), 'HorizontalAlignment', 'left');


% Kaiser Window beta = 5.8703
w7_1 = kaiser(M, beta);
subplot(2,3,4);
stem(0:M-1, w7_1);
ylim([0 1.5]);
title('Kaiser beta = 5.8703')
text(1, max(w7_1), sprintf('Attenuation: %.2f dB', beta), 'HorizontalAlignment', 'left');

% Kaiser Window beta = 4.8703
beta1 = beta - 1;
w7_2 = kaiser(M, beta1);
subplot(2,3,5);
stem(0:M-1, w7_2);
ylim([0 1.5]);
title('Kaiser beta = 4.8703')
text(1, max(w7_2), sprintf('Attenuation: %.2f dB', beta1), 'HorizontalAlignment', 'left');

% Kaiser Window beta = 6.8703
beta2 = beta + 1;
w7_3 = kaiser(M, beta2);
subplot(2,3,6);
stem(0:M-1, w7_3);
ylim([0 1.5]);
title('Kaiser beta = 6.8703')
text(1, max(w7_3), sprintf('Attenuation: %.2f dB', beta2), 'HorizontalAlignment', 'left');

%%


figure('Name','Impulse response (3) ');
%  Lanczos Window L = 3
w8_1 = lanczos_window(M,L); 
subplot(2,3,1);
stem(0:M-1, w8_1);
ylim([0 1.5]);
title('Lanczos L = 3');
text(1, max(w8_1), sprintf('Aperture: %.2f dB', L), 'HorizontalAlignment', 'left');

% Lanczos Window L = 2
L1 = L - 1;
w8_2 = lanczos_window(M,L1); 
subplot(2,3,2);
stem(0:M-1, w8_2);
ylim([0 1.5]);
title('Lanczos L = 2');
text(1, max(w8_2), sprintf('Aperture: %.2f dB', L1), 'HorizontalAlignment', 'left');

% Lanczos Window  L = 4
L2 = L + 1;
w8_3 = lanczos_window(M,L); 
subplot(2,3,3);
stem(0:M-1, w8_3);
ylim([0 1.5]);
title('Lanczos L = 4');
text(1, max(w8_3), sprintf('Aperture: %.2f dB', L2), 'HorizontalAlignment', 'left');



% Tukey Window  alfa = 49.0270;
w9_1 = tukeywin(M,alfa/100); 
subplot(2,3,4);
stem(0:M-1, w9_1);
ylim([0 1.5]);
title('Tukey alfa = 49.0270');
text(1, max(w9_1), sprintf('Alfa: %.2f  %', alfa), 'HorizontalAlignment', 'left');

% Tukey Window  alfa = alfa - 15 = 34.0270;
alfa1 = (alfa - 15)/100;
w9_2 = tukeywin(M,alfa1); 
subplot(2,3,5);
stem(0:M-1, w9_2);
ylim([0 1.5]);
title('Tukey alfa = 34.0270');
text(1, max(w9_2), sprintf('Alfa: %.2f  %', alfa1), 'HorizontalAlignment', 'left');


% Tukey Window  alfa = alfa + 15 = 64.0270;
alfa2 = (alfa + 15)/100;
w9_3 = tukeywin(M,alfa2); 
subplot(2,3,6);
stem(0:M-1, w9_3);
ylim([0 1.5]);
title('Tukey alfa = 64.0270');
text(1, max(w9_3), sprintf('Alfa: %.2f  %', alfa2), 'HorizontalAlignment', 'left');

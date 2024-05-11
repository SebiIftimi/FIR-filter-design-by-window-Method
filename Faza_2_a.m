
omega_c = 1.5402; % Cutoff frequency of the filter
freq_c = omega_c/pi; % Number between 0 and 1 indicating the normalized cutoff frequency of the filter

M = 25; % Duration of the windows (the same for all 9 windows)
r = 89.6757; % Attenuation of the side/parasitic lobes of the Chebyshev window's spectrum;
beta = 5.8703; % Height of the first side/parasitic lobe of the Kaiser window's spectrum;
L = 3; % Aperture of the Lanczos window; an integer between 2 and 7;
alfa = 49.0270; % Percentage of the constant part of the Tukey window; varies between 20% and 80%

% h - Weighting sequence (attenuated sine)

%% Rectangular Window

% Designing the filter using the Rectangular Window
h = fir1(M-1, freq_c, boxcar(M));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
figure
subplot(5,1, 1);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Rectangular Window');
xlabel('Normalized time');
ylabel('Magnitude');
%%
% Designing the filter using the Triangular Window
h = fir1(M-1, freq_c, triang(M));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(5,1, 2);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Triangular Window');
xlabel('Normalized time');
ylabel('Magnitude');

%%
% Designing the filter using the  Blackman Window
h = fir1(M-1, freq_c, blackman(M));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(5,1, 3);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Blackman Window');
xlabel('Normalized time');
ylabel('Magnitude');

%%
% Designing the filter using the  Hamming Window
h = fir1(M-1, freq_c, hamming(M));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(5,1, 4);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter -  Hamming Window');
xlabel('Normalized time');
ylabel('Magnitude');


%%
% Designing the filter using the  Hanning Window
h = fir1(M-1, freq_c, hanning(M));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(5,1, 5);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter -  Hanning Window');
xlabel('Normalized time');
ylabel('Magnitude');

%%
% Designing the filter using the  Cebîșev Window
% r =  89.6757
h = fir1(M-1, freq_c, chebwin(M,r));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
figure
subplot(2,3, 1);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Window Cebîșev [r =  89.6757]');
xlabel('Normalized time');
ylabel('Magnitude');

% r = r - 5;
h = fir1(M-1, freq_c, chebwin(M,r-5));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 2);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter -  Cebîșev Window [r =  84.6757]');
xlabel('Normalized time');
ylabel('Magnitude');


% r = r + 5;
h = fir1(M-1, freq_c, chebwin(M,r+5));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 3);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Cebîșev Window [r =  94.6757]');
xlabel('Normalized time');
ylabel('Magnitude');


% Designing the filter using the Kaiser Window
% beta = 5.8703
h = fir1(M-1, freq_c, chebwin(M,beta));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 4);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Kaiser Window [beta = 5.8703]');
xlabel('Normalized time');
ylabel('Magnitude');


% beta = 4.8703
h = fir1(M-1, freq_c, chebwin(M,beta-1));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 5);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter -  Kaiser Window [beta = 4.8703]');
xlabel('Normalized time');
ylabel('Magnitude');

% beta = 6.8703
h = fir1(M-1, freq_c, chebwin(M,beta+1));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 6);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Kaiser Window [beta = 6.8703]');
xlabel('Normalized time');
ylabel('Magnitude');


%%
% Designing the filter using the Lanczos Window
% L = 3
h = fir1(M-1, freq_c, lanczos_window(M,L));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
figure
subplot(2,3, 1);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Lanczos Window [ L = 3 ]');
xlabel('Normalized time');
ylabel('Magnitude');


% L = 2
h = fir1(M-1, freq_c, lanczos_window(M,L-1));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 2);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Lanczos Window [ L = 2 ]');
xlabel('Normalized time');
ylabel('Magnitude');

% L = 4
h = fir1(M-1, freq_c, lanczos_window(M,L+1));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 3);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Lanczos Window [ L = 4 ]');
xlabel('Normalized time');
ylabel('Magnitude');

% Designing the filter using the  Tuckey Window
% alfa = 49.0270 %;
h = fir1(M-1, freq_c, tukeywin(M,alfa/100));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 4);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Tukey Window [ alfa = 49.0270%]');
xlabel('Normalized time');
ylabel('Magnitude');

% alfa = 34.0270 %;
h = fir1(M-1, freq_c, tukeywin(M,(alfa-15)/100));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 5);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Tukey Window [alfa = 34.0270 %]');
xlabel('Normalized time');
ylabel('Magnitude');

% alfa = 64.0270 %;
h = fir1(M-1, freq_c, tukeywin(M,(alfa+15)/100));
% Calculating the frequency response with a resolution of 5000 points
[H, w] = freqz(h, 1, 5000);
subplot(2,3, 6);
stem(0:M-1, h, 'filled');
title('  The weighting sequence of the FTJ filter - Tukey Window [alfa = 64.0270 %]');
xlabel('Normalized time');
ylabel('Magnitude');

%% Spectrele filtrelor obtinute pentru fiecare fereastra ne-parametrica
% (inclusiv cea dreptunghiulara ) pe prima linie si fazele aferente pe
% linia a doua


% Designing the filter using the Rectangular Window
h = fir1(M-1, freq_c, boxcar(M));
[H, w] = freqz(h, 1, 5000);
figure;
subplot(2,5,1);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum  - Dreptunghiulara');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(2,5,6);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Dreptunghiulara');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


% Designing the filter using the  Triangular Window
h = fir1(M-1, freq_c, triang(M));
[H, w] = freqz(h, 1, 5000);
subplot(2,5,2);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum Triangular Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(2,5,7);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum - Triangular Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


% Designing the filter using the  Blackman Window
h = fir1(M-1, freq_c, blackman(M));
[H, w] = freqz(h, 1, 5000);
subplot(2,5,3);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude spectrum Blackman Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(2,5,8);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum Blackman Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

% Designing the filter using the Hemming Window
h = fir1(M-1, freq_c, hamming(M));
[H, w] = freqz(h, 1, 5000);
subplot(2,5,4);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum Hemming Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(2,5,9);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum Hemming Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


% Designing the filter using the  Henning Window
h = fir1(M-1, freq_c, hanning(M));
[H, w] = freqz(h, 1, 5000);
subplot(2,5,5);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum Henning Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(2,5,10);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum Henning Window');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


%%
% Designing the filter using the  Cebisev Window
h = fir1(M-1, freq_c, chebwin(M, r));
[H, w] = freqz(h, 1, 5000);
figure
subplot(3,4,1);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Cebisev r ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,2);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Cebisev r');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


h = fir1(M-1, freq_c, chebwin(M, r-5));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,5);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Cebisev r-5 ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,6);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Cebisev r-5');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

h = fir1(M-1, freq_c, chebwin(M, r+5));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,9);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Cebisev r+5 ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,10);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Cebisev r+5');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

%%
% Designing the filter using the  Kaiser Window
h = fir1(M-1, freq_c, kaiser(M, beta));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,3);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Kaiser beta ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,4);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Kaiser beta');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

%
h = fir1(M-1, freq_c, kaiser(M, beta-1));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,7);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Kaiser beta-1 ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,8);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Kaiser beta-1');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

%
h = fir1(M-1, freq_c, kaiser(M, beta+1));
[H, w] = freqz(h, 1, 5000);

subplot(3,4,11);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Kaiser beta +1');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,12);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Kaiser beta+1');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

%%

% Designing the filter using the Lanczos Window 
h = fir1(M-1, freq_c, lanczos_window(M, L));
[H, w] = freqz(h, 1, 5000);
figure
subplot(3,4,1);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Lanczos L ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,2);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Lanczos ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

%
h = fir1(M-1, freq_c, lanczos_window(M, L-1));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,5);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Lanczos L -1');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,6);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Lanczos -1 ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


%
h = fir1(M-1, freq_c, lanczos_window(M, L+1));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,9);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Lanczos L +1 ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,10);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Lanczos + 1');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

%%


% Designing the filter using the Tukey Window
h = fir1(M-1, freq_c, tukeywin(M, alfa/100));
[H, w] = freqz(h, 1, 5000);

subplot(3,4,3);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Tuckey alfa ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,4);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Tukey alfa');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;

h = fir1(M-1, freq_c, tukeywin(M, (alfa-15)/100));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,7);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Tuckey alfa-15 ');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,8);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Tukey alfa-15');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;


%
h = fir1(M-1, freq_c, tukeywin(M, (alfa+15)/100));
[H, w] = freqz(h, 1, 5000);
subplot(3,4,11);
plot(w/pi, 20*log10(abs(H)));
title('  Amplitude spectrum - Tuckey alfa +15');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,4,12);
plot(w/pi, unwrap(angle(H)));
title('Phase spectrum  - Tukey alfa+15');
xlabel('Normalized frequency (\times\pi rad/sample)');
ylabel('Faza (radiani)');
grid on;





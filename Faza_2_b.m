
omega_c = 1.5402; % Cutoff frequency of the filter
freq_c = omega_c/pi; % Number between 0 and 1 indicating the normalized cutoff frequency of the filter

M = 25; % Duration of the windows (the same for all 9 windows)
r = 89.6757; % Attenuation of the side/parasitic lobes of the Chebyshev window's spectrum;
beta = 5.8703; % Height of the first side/parasitic lobe of the Kaiser window's spectrum;
L = 3; % Aperture of the Lanczos window; an integer between 2 and 7;
alfa = 49.0270; % Percentage of the constant part of the Tukey window; varies between 20% and 80%


%% Kaiser Window (placed first)

% Designing the filter using the Kaiser window M = 25
h = fir1(M-1, freq_c, kaiser(M, beta));
[H, w] = freqz(h, 1, 5000);
figure
subplot(3,2,1);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude Spectrum - Kaiser - M = 25');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,2,2);
plot(w/pi, unwrap(angle(H)));
title('Phase Spectrum - Kaiser - M = 25');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

%%
% Designing the filter using the Kaiser window - M = M+[M/2]
h = fir1(37-1, freq_c, kaiser(37, beta));
[H, w] = freqz(h, 1, 5000);
subplot(3,2,3);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude Spectrum - Kaiser - M = 37');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,2,4);
plot(w/pi, unwrap(angle(H)));
title('Phase Spectrum - Kaiser - M = 37');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

%%
% Designing the filter using the Kaiser window - M = 2M
h = fir1(50-1, freq_c, kaiser(50, beta));
[H, w] = freqz(h, 1, 5000);
subplot(3,2,5);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude Spectrum - Kaiser - M = 50');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,2,6);
plot(w/pi, unwrap(angle(H)));
title('Phase Spectrum - Kaiser - M = 50');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

%% Filter designed with Lanczos window (L+1)
% M = 25
h = fir1(M-1, freq_c, lanczos_window(M, L+1));
[H, w] = freqz(h, 1, 5000);
figure
subplot(3,2,1);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude Spectrum - Lanczos L +1 - M');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,2,2);
plot(w/pi, unwrap(angle(H)));
title('Phase Spectrum - Lanczos + 1 - M');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

%% 
% M = 37
h = fir1(37-1, freq_c, lanczos_window(37, L+1));
[H, w] = freqz(h, 1, 5000);
subplot(3,2,3);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude Spectrum - Lanczos L +1 - M = 37');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Amplitude (dB)');
grid on;

% Displaying the phase spectrum
subplot(3,2,4);
plot(w/pi, unwrap(angle(H)));
title('Phase Spectrum - Lanczos + 1 - M = 37');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

%% 
% M = 50
h = fir1(50-1, freq_c, lanczos_window(50, L+1));
[H, w] = freqz(h, 1, 5000);
subplot(3,2,5);
plot(w/pi, 20*log10(abs(H)));
title('Amplitude Spectrum - Lanczos L +1 - M = 50');
xlabel('Normalized Frequency (\times\pi rad/sample)');

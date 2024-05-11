omega_p = 1.5402; % Passband frequency; (a number between 0.2*pi and 0.8*pi);
omega_s = 1.8778; % Stopband frequency (a number between omega_p and at most omega_p+0.15*pi);
Delta_p = 4.9027; % Tolerance imposed in the passband (a number between 2% and 8%).
Delta_s = 4.9027; % Tolerance imposed in the stopband

M = 25; % Reference order of the filter
K = 5000;

% The working window will be the Kaiser Window - beta (simple)
beta = 5.8703; % Height of the first side/parasitic lobe of the Kaiser window's spectrum;

M_1 = 25;
M_2 = 37;
M_3 = 50;

w_1 = 0.25;
w_2 = 0.5;
w_3 = 0.75;

omega_c_1 = (1-w_1)*omega_p+w_1*omega_s;
omega_c_2 = (1-w_2)*omega_p+w_2*omega_s;
omega_c_3 = (1-w_3)*omega_p+w_3*omega_s;

%% Designing filters for the Kaiser Window (beta) - varying omega_c
% M_1 - varying omega_c
filter_1 = fir1(M_1-1, omega_c_1/pi, kaiser(M_1, beta));
filter_2 = fir1(M_1-1, omega_c_2/pi, kaiser(M_1, beta));
filter_3 = fir1(M_1-1, omega_c_3/pi, kaiser(M_1, beta));

% M_2 - varying omega_c
filter_4 = fir1(M_2-1, omega_c_1/pi, kaiser(M_2, beta));
filter_5 = fir1(M_2-1, omega_c_2/pi, kaiser(M_2, beta));
filter_6 = fir1(M_2-1, omega_c_3/pi, kaiser(M_2, beta));

% M_3 - varying omega_c
filter_7 = fir1(M_3-1, omega_c_1/pi, kaiser(M_3, beta));
filter_8 = fir1(M_3-1, omega_c_2/pi, kaiser(M_3, beta));
filter_9 = fir1(M_3-1, omega_c_3/pi, kaiser(M_3, beta));

%% Calculating the tolerances for each filter - Delta_pr, Delta_sr

[Delta_pr_1, Delta_sr_1] = evaluationFIRfilter(filter_1, omega_p, omega_s);
[Delta_pr_2, Delta_sr_2] = evaluationFIRfilter(filter_2, omega_p, omega_s);
[Delta_pr_3, Delta_sr_3] = evaluationFIRfilter(filter_3, omega_p, omega_s);
[Delta_pr_4, Delta_sr_4] = evaluationFIRfilter(filter_4, omega_p, omega_s);
[Delta_pr_5, Delta_sr_5] = evaluationFIRfilter(filter_5, omega_p, omega_s);
[Delta_pr_6, Delta_sr_6] = evaluationFIRfilter(filter_6, omega_p, omega_s);
[Delta_pr_7, Delta_sr_7] = evaluationFIRfilter(filter_7, omega_p, omega_s);
[Delta_pr_8, Delta_sr_8] = evaluationFIRfilter(filter_8, omega_p, omega_s);
[Delta_pr_9, Delta_sr_9] = evaluationFIRfilter(filter_9, omega_p, omega_s);

%% The values obtained for each filter:

% Delta_pr_1 = 33.9202
% Delta_sr_1 = 10.1118

% Delta_pr_2 =20.2109
% Delta_sr_2 =0.2147

% Delta_pr_3 =10.1300
% Delta_sr_3 =33.9277

% Delta_pr_4 =26.6349
% Delta_sr_4 =2.0956

% Delta_pr_5 =10.0577
% Delta_sr_5 =10.0818

% Delta_pr_6 =2.0905
% Delta_sr_6 =26.6154

% Delta_pr_7 =19.6155
% Delta_sr_7 =0.0912

% Delta_pr_8 =3.5355
% Delta_sr_8 =3.5241

% Delta_pr_9 = 0.0977
% Delta_sr_9 =19.6021


%% Plotting graphs

%% Weighting sequences for filters in descending order of
% performance
figure; 

% Filter 8
subplot(3,3,1);
stem(0:M_3-1, filter_8, 'filled'); % Plot the weighting sequence
title('W.S - Filter 8 - M=50');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

% Filter 2
subplot(3,3,2);
stem(0:M_1-1, filter_2, 'filled'); % Plot the weighting sequence
title('W.S - Filter 2 - M=25');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

% Filter 5
subplot(3,3,3);
stem(0:M_2-1, filter_5, 'filled'); % Plot the weighting sequence
title('W.S - Filter 5 - M=37');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

% Filter 7
subplot(3,3,4);
stem(0:M_3-1, filter_7, 'filled'); % Plot the weighting sequence
title('W.S - Filter 7 - M=50');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

% Filter 9
subplot(3,3,5);
stem(0:M_3-1, filter_9, 'filled'); % Plot the weighting sequence
title('W.S - Filter 9 - M=50');
xlabel('Coefficient Index');
ylabel('Coefficient Value');


% For the next 4 I will consider that the filter order is more important
% than the tolerance

% Filter 1
subplot(3,3,6);
stem(0:M_1-1, filter_1, 'filled'); % Plot the weighting sequence
title('W.S - Filter 1 - M=25');
xlabel('Coefficient Index');
ylabel('Coefficient Value');


% Filter 3
subplot(3,3,7);
stem(0:M_1-1, filter_3, 'filled'); % Plot the weighting sequence
title('W.S - Filter 3 - M=25');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

% Filter 4
subplot(3,3,8);
stem(0:M_2-1, filter_4, 'filled'); % Plot the weighting sequence
title('W.S - Filter 4 - M=37');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

% Filter 6
subplot(3,3,9);
stem(0:M_2-1, filter_6, 'filled'); % Plot the weighting sequence
title('W.S - Filter 6 - M=37');
xlabel('Coefficient Index');
ylabel('Coefficient Value');



%% Graphs of the spectra of the designed filters


%% Filter 8

% Calculating the frequency response
[H8, omega] = freqz(filter_8, 1, 5000);
H8_dB = 20*log10(abs(H8)); % Conversion to decibels

% Creating the plot
figure;
subplot(3,3,1)
plot(omega/pi, H8_dB);
title('Spectrum of Filter 8 (Order 50)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_2/pi omega_c_2/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_2/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');



%% Graphs of the spectra of the designed filters

%% Filter 2

[H, omega] = freqz(filter_2, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,2)
plot(omega/pi, H_dB);
title('Spectrum of Filter 2 (Order 25)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_2/pi omega_c_2/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_2/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');


%% Filter 5

[H, omega] = freqz(filter_5, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,3)
plot(omega/pi, H_dB);
title('Spectrum of Filter 5 (Order 37)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_2/pi omega_c_2/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_2/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');


%% Filter 7

[H, omega] = freqz(filter_7, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,4)
plot(omega/pi, H_dB);
title('Spectrum of Filter 7 (Order 50)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_1/pi omega_c_1/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_1/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');




%% Filter 9

[H, omega] = freqz(filter_9, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,5)
plot(omega/pi, H_dB);
title('Spectrum of Filter 9 (Order 50)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_3/pi omega_c_3/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_3/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

%% Filter 1

[H, omega] = freqz(filter_1, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,6)
plot(omega/pi, H_dB);
title('Spectrum of Filter 1 (Order 25)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_1/pi omega_c_1/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_1/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');


%% Filter 3

[H, omega] = freqz(filter_3, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,7)
plot(omega/pi, H_dB);
title('Spectrum of Filter 3 (Order 25)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_3/pi omega_c_3/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_3/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');


%% Filter 4

[H, omega] = freqz(filter_4, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,8)
plot(omega/pi, H_dB);
title('Spectrum of Filter 4 (Order 37)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_1/pi omega_c_1/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_1/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_p/100);
Delta_p_neg_dB = 20*log10(1 - Delta_p/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_s/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');


%% Filter 6

[H, omega] = freqz(filter_6, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels

% Creating the plot
subplot(3,3,9)
plot(omega/pi, H_dB);
title('Spectrum of Filter 6 (Order 37)');

ylabel('Magnitude (dB)');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_3/pi omega_c_3/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_3/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');

% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_pr_6/100);
Delta_p_neg_dB = 20*log10(1 - Delta_pr_6/100);
line(xlim, [Delta_p_dB Delta_p_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_dB, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding the horizontal line in the stopband and label
Delta_s_dB = 20*log10(Delta_sr_6/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');


%% Graphs for the phases of the designed filters

%% Filter 8
[H, omega] = freqz(filter_8, 1, 5000);

% Creating the phase plot
figure;
subplot(3,3,1);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 8 (Order 50)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_2/pi omega_c_2/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_2/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');


%% Filter 2
[H, omega] = freqz(filter_2, 1, 5000);

% Creating the phase plot
subplot(3,3,2);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 2 (Order 25)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_2/pi omega_c_2/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_2/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');


%% Filter 5
[H, omega] = freqz(filter_5, 1, 5000);

% Creating the phase plot
subplot(3,3,3);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 5 (Order 37)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_2/pi omega_c_2/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_2/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');


%% Filter 7
[H, omega] = freqz(filter_7, 1, 5000);

% Creating the phase plot
subplot(3,3,4);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 7 (Order 50)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_1/pi omega_c_1/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_1/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');



%% Filter 9
[H, omega] = freqz(filter_9, 1, 5000);

% Creating the phase plot
subplot(3,3,5);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 9 (Order 50)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_3/pi omega_c_3/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_3/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');



%% Filter 1
[H, omega] = freqz(filter_1, 1, 5000);

% Creating the phase plot
subplot(3,3,6);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 1 (Order 25)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_1/pi omega_c_1/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_1/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');


%% Filter 3
[H, omega] = freqz(filter_3, 1, 5000);

% Creating the phase plot
subplot(3,3,7);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 3 (Order 25)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_3/pi omega_c_3/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_3/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');


%% Filter 4
[H, omega] = freqz(filter_4, 1, 5000);

% Creating the phase plot
subplot(3,3,8);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 4 (Order 37)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_1/pi omega_c_1/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_1/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');


%% Filter 6
[H, omega] = freqz(filter_6, 1, 5000);

% Creating the phase plot
subplot(3,3,9);
plot(omega/pi, unwrap(angle(H)));
title('Phase of Filter 6 (Order 37)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their bases
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_3/pi omega_c_3/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_3/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');

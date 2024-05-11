
M = 25; % Filter order
K = 5000;

omega_p = 1.5402; % Passband frequency; (a number between 0.2*pi and 0.8*pi);
omega_s = 1.8778; % Stopband frequency (a number between omega_p and at most omega_p+0.15*pi);
Delta_p = 4.9027; % Tolerance imposed in the passband (a number between 2% and 8%).
Delta_s = 4.9027; % Tolerance imposed in the stopband

%%
% Initialize sum variable to a large number
sum = 1000;

for i = 1:4
    % Test Chebyshev window
    if(i==1)
        for M = 16:100
            for omega_c = omega_p:0.01:omega_s
                for r_chebyshev = 20:1:100
                    [h, Delta_pr, Delta_sr, order] = filter_f_4_cebisev_test(M, omega_p, omega_c, omega_s, r_chebyshev);
                    if (Delta_pr + Delta_sr < sum)
                        sum = Delta_pr + Delta_sr;
                        Delta_pr_1 = Delta_pr;
                        Delta_sr_1 = Delta_sr;
                        M_1 = M;
                        omega_c_1 = omega_c;
                        h_1 = h;
                        r_chebyshev_1 = r_chebyshev;
                    end
                end
            end
        end
        disp('Done Chebyshev');
    end
% 
% 
    % Test the Kaiser window
    if(i==2)
        sum = 1000;  % Reinitialize sum for new test
        for M = 16:100  % Loop over possible filter orders
            for omega_c = omega_p:0.01:omega_s  % Loop over cutoff frequencies
                for beta_kaiser = 0:1:10  % Loop over Kaiser window beta values
                    [h, Delta_pr, Delta_sr, order] = filter_f_4_kaiser_test(M, omega_p, omega_c, omega_s, beta_kaiser);
                    if (Delta_pr + Delta_sr < sum)  % Check if the current configuration is better
                        sum = Delta_pr + Delta_sr;  % Update the best sum
                        Delta_pr_2 = Delta_pr;  % Store the best passband deviation
                        Delta_sr_2 = Delta_sr;  % Store the best stopband deviation
                        M_2 = M;  % Store the best filter order
                        omega_c_2 = omega_c;  % Store the best cutoff frequency
                        h_2 = h;  % Store the best filter coefficients
                        beta_kaiser_2 = beta_kaiser;  % Store the best beta
                    end
                end
            end
        end
        disp('Done Kaiser');  % Display completion message for Kaiser window
    end

    % Test the Tukey window
    if(i==3)
        sum = 1000;  % Reinitialize sum for new test
        for M = 16:100  % Loop over possible filter orders
            for omega_c = omega_p:0.01:omega_s  % Loop over cutoff frequencies
                for alfa_tukey = 0:0.1:1  % Loop over Tukey window alpha values
                    [h, Delta_pr, Delta_sr, order] = filter_f_4_tukey_test(M, omega_p, omega_c, omega_s, alfa_tukey);
                    if (Delta_pr + Delta_sr < sum)  % Check if the current configuration is better
                        sum = Delta_pr + Delta_sr;  % Update the best sum
                        Delta_pr_3 = Delta_pr;  % Store the best passband deviation
                        Delta_sr_3 = Delta_sr;  % Store the best stopband deviation
                        M_3 = M;  % Store the best filter order
                        omega_c_3 = omega_c;  % Store the best cutoff frequency
                        h_3 = h;  % Store the best filter coefficients
                        alfa_tukey_3 = alfa_tukey;  % Store the best alpha
                    end
                end
            end
        end
        disp('Done Tukey');  % Display completion message for Tukey window
    end

% 
%     % Testing the Lanczos window
%     if(i==4)
%         sum = 1000;
%         for M = 16:100
%             for omega_c = omega_p:0.01:omega_s
%                 for L_lanczos = 2:7
%                     [h, Delta_pr, Delta_sr, order] = lanczos_filter_test_4_function(M, omega_p, omega_c, omega_s, L_lanczos);
%                     if ( Delta_pr + Delta_sr < sum )
%                         sum = Delta_pr + Delta_sr;
%                         Delta_pr_4 = Delta_pr;
%                         Delta_sr_4 = Delta_sr;
%                         M_4 = M;
%                         omega_c_4 = omega_c;
%                         h_4 = h;
%                         L_lanczos_4 = L_lanczos;
%                     end
%                 end
%             end
%         end
%         disp('Done Lanczos');
%     end
 end

%% After running the program, we have the following classification of filters:

% 1. Chebyshev Window (r = 100, M = 79, omega_c = 1.8702)
% 2. Kaiser Window (beta = 10, M = 94, omega_c = 1.8702)
% 3. Tukey Window (alfa = 1, M = 100, omega_c = 1.8702)
% 4. Lanczos Window (L = 7, M = 97, omega_c = 1.8502)

%% Omega_c Values and Filter Design

omega_c_gold = 1.8702;
omega_c_silver = 1.8702;
omega_c_bronze = 1.8702;

%  Filter Design
filtru_gold = fir1(79-1, omega_c_silver/pi, chebwin(79, 100));
filtru_silver = fir1(94-1, omega_c_gold/pi, kaiser(94, 10));
filtru_bronze = fir1(100-1, omega_c_bronze/pi, tukeywin(100, 1));

%% Delta_pr and Delta_sr Values

Delta_pr_chebwin = 2.016302508622836e-04;
Delta_sr_chebwin = 2.086386469352372e-06;

Delta_pr_kaiser = 6.465551919188073e-04;
Delta_sr_kaiser = 1.387778780781446e-15;

Delta_pr_tukey = 0.031906460957554;
Delta_sr_tukey = 5.551115123125783e-15;




%% Graphs

%% Spectrum of the Gold Filter


[H_gold, omega] = freqz(filtru_gold, 1, 5000);
H_gold_dB = 20*log10(abs(H_gold)); % Conversion to decibels
figure
subplot(3,3,1)
plot(omega/pi, H_gold_dB);
title('Spectrum of the Gold Filter');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_gold/pi omega_c_gold/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_gold/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');


% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_pr_chebwin/100);
Delta_p_neg_dB = 20*log10(1 - Delta_pr_chebwin/100);
line(xlim, [Delta_pr_chebwin Delta_pr_chebwin], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_pr_kaiser, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding a horizontal line in the stop band and a label
Delta_s_dB = 20*log10(Delta_sr_chebwin/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');



%% Spectrum of the Silver Filter

[H_silver, omega] = freqz(filtru_silver, 1, 5000);
H_silver_dB = 20*log10(abs(H_silver)); % Conversion to decibels

subplot(3,3,2)
plot(omega/pi, H_silver_dB);
title('Spectrum of the Silver Filter');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_silver/pi omega_c_silver/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_silver/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');


% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_pr_kaiser/100);
Delta_p_neg_dB = 20*log10(1 - Delta_pr_kaiser/100);
line(xlim, [Delta_pr_kaiser Delta_pr_kaiser], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_pr_kaiser, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding a horizontal line in the stop band and a label
Delta_s_dB = 20*log10(Delta_sr_kaiser/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');



%% Spectrum of the Bronze Filter

[H_bronze, omega] = freqz(filtru_bronze, 1, 5000);
H_bronze_dB = 20*log10(abs(H_bronze)); % Conversion to decibels

subplot(3,3,3)
plot(omega/pi, H_bronze_dB);
title('Spectrum of the Bronze Filter');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_bronze/pi omega_c_bronze/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_bronze/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');



% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_pr_tukey/100);
Delta_p_neg_dB = 20*log10(1 - Delta_pr_tukey/100);
line(xlim, [Delta_pr_tukey Delta_pr_tukey], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_pr_tukey, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding a horizontal line in the stop band and a label
Delta_s_dB = 20*log10(Delta_sr_tukey/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');



%% Phases of the Spectra


[H_gold, omega] = freqz(filtru_gold, 1, 5000);

subplot(3,3,4);
plot(omega/pi, unwrap(angle(H_gold)));
title('Phase of the Gold Filter');
xlabel('Normalized frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their base
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_gold/pi omega_c_gold/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_gold/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');



%% Phase of the Silver Filter

[H_silver, omega] = freqz(filtru_silver, 1, 5000);

subplot(3,3,5);
plot(omega/pi, unwrap(angle(H_silver)));
title('Phase of the Silver Filter');
xlabel('Normalized frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their base
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_silver/pi omega_c_silver/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_gold/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');

%% Phase of the Bronze Filter

[H_bronze, omega] = freqz(filtru_bronze, 1, 5000);

subplot(3,3,6);
plot(omega/pi, unwrap(angle(H_bronze)));
title('Phase of the Bronze Filter');
xlabel('Normalized frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their base
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c_bronze/pi omega_c_bronze/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c_gold/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');

%% Weight sequence for the GOLD filter

subplot(3,3,7);
stem(0:79-1, filtru_gold, 'filled'); % Plot the weight sequence
title('Weight Sequence - Gold Filter');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

%% Weight sequence for the SILVER filter

subplot(3,3,8);
stem(0:94-1, filtru_silver, 'filled'); % Plot the weight sequence
title('Weight Sequence - Silver Filter');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

%% Weight sequence for the BRONZE filter

subplot(3,3,9);
stem(0:100-1, filtru_bronze, 'filled'); % Plot the weight sequence
title('Weight Sequence - Bronze Filter');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

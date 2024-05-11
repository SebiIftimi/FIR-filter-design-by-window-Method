
    omega_p = 0.2*pi;
    omega_s = 0.5*pi;

%Testing the Kaiser window

sum = 1000;
for M = 16:50
    for omega_c = omega_p:0.01:omega_s
        for beta_kaiser = 0:1:10
            [h, Delta_pr, Delta_sr, order] = kaiser_filter_test_function_5(M, omega_p, omega_c, omega_s, beta_kaiser);
            if ( Delta_pr + Delta_sr < sum )
                sum = Delta_pr + Delta_sr;
                Delta_pr_2 = Delta_pr;
                Delta_sr_2 = Delta_sr;
                M_2 = M;
                omega_c_2 = omega_c;
                h_2 = h;
                beta_kaiser_2 = beta_kaiser;
            end
        end
    end
end
disp('Done Kaiser');

filter = fir1(48, omega_c/pi, kaiser(49, 10));

%% Spectrum of the filter

[H, omega] = freqz(filter, 1, 5000);
H_dB = 20*log10(abs(H)); % Conversion to decibels
figure
subplot(3,1,1)
plot(omega/pi, H_dB);
title('Spectrum of the Filter M = 49, Kaiser Window, beta = 10');

% Adding vertical lines and labels
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c/pi omega_c/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c/pi, -5, '\omega_c', 'Color', 'red', 'HorizontalAlignment', 'right');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, -5, '\omega_s', 'Color', 'red', 'HorizontalAlignment', 'right');


% Adding horizontal lines in the passband and labels
Delta_p_dB = 20*log10(1 + Delta_pr_2/100);
Delta_p_neg_dB = 20*log10(1 - Delta_pr_2/100);
line(xlim, [Delta_pr_2 Delta_pr_2], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_pr_2, '1+\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

line(xlim, [Delta_p_neg_dB Delta_p_neg_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_p_neg_dB, '1-\Delta_p', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Adding a horizontal line in the stop band and a label
Delta_s_dB = 20*log10(Delta_sr_2/100);
line(xlim, [Delta_s_dB Delta_s_dB], 'Color', 'green', 'LineStyle', '--');
text(-0.05, Delta_s_dB, '\Delta_s', 'Color', 'green', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

%% Phase

[H, omega] = freqz(filter, 1, 5000);

subplot(3,1,2);
plot(omega/pi, unwrap(angle(H)));
title('Phase of the Kaiser Filter, M = 49, beta = 10');
xlabel('Normalized frequency (\times \pi rad/sample)');
ylabel('Phase (radians)');

% Adding vertical lines and labels at their base
line([omega_p/pi omega_p/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_p/pi, min(ylim), ' \omega_p', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_c/pi omega_c/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_c/pi, min(ylim), ' \omega_c', 'Color', 'red', 'VerticalAlignment', 'top');

line([omega_s/pi omega_s/pi], ylim, 'Color', 'red', 'LineStyle', '--');
text(omega_s/pi, min(ylim), ' \omega_s', 'Color', 'red', 'VerticalAlignment', 'top');

%% Weight sequence

subplot(3,1,3);
stem(0:48, filter, 'filled'); % Plot the weight sequence
title('Weight Sequence - Kaiser Filter, M = 49');
xlabel('Coefficient Index');
ylabel('Coefficient Value');

 

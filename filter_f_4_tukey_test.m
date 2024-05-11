function [h, Delta_pr, Delta_sr, ordin] = filter_f_4_tukey_test(M, omega_p, omega_c, omega_s, alfa_tukey)
    Delta_p = 4.9027; % tolerance imposed in the passband (a number between 2% and 8%).
    Delta_s = 4.9027; % tolerance imposed in the stopband
    
    h = fir1(M-1, omega_c/pi, tukeywin(M, alfa_tukey));
    [Delta_pr, Delta_sr] = function_3a(h, omega_p, omega_s);
    ordin = M;

    % if (Delta_pr < Delta_p && Delta_sr < Delta_s)
    %     filtru_valid = 1;
    %     return;
    % else
    %     filtru_valid = 0;
    %     return;
    % end
end
function [h, Delta_pr, Delta_sr, ordin] = lanczos_filter_test_4_function(M, omega_p, omega_c, omega_s, L_lanczos)
    Delta_p = 4.9027; % toleranta impusa in banda de trecere (un numar intre 2% si 8%).
    Delta_s = 4.9027; % toleranta impusa in banda de stopare
    
    h = fir1(M-1, omega_c/pi, lanczos_window(M, L_lanczos));
    [Delta_pr, Delta_sr] = functie_3a(h, omega_p, omega_s);
    ordin = M;

    % if (Delta_pr < Delta_p && Delta_sr < Delta_s)
    %     filtru_valid = 1;
    %     return;
    % else
    %     filtru_valid = 0;
    %     return;
    % end
end
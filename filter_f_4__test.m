function [h, Delta_pr, Delta_sr, order] = filter_f_4__test(M, omega_p, omega_c, omega_s, r_chebyshev)
    Delta_p = 4.9027; % tolerance imposed in the passband (a number between 2% and 8%).
    Delta_s = 4.9027; % tolerance imposed in the stopband
    
    h = fir1(M-1, omega_c/pi, chebwin(M, r_chebyshev)); % Create a filter using the Chebyshev window
    [Delta_pr, Delta_sr] = function_3a(h, omega_p, omega_s); % Calculate passband and stopband errors
    order = M; % Set the filter order

    % if (Delta_pr < Delta_p && Delta_sr < Delta_s)
    %     valid_filter = 1;
    %     return;
    % else
    %     valid_filter = 0;
    %     return;
    % end
end

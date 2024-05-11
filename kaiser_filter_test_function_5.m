function [h, Delta_pr, Delta_sr, ordin, filtru_valid] = kaiser_filter_test_function_5(M, omega_p, omega_c, omega_s, beta_kaiser)
   
    Delta_p=0.03;
    Delta_s=0.03;

    h = fir1(M-1, omega_c/pi, kaiser(M, beta_kaiser));
    [Delta_pr, Delta_sr] = function_3a(h, omega_p, omega_s);
    ordin = M;

     % if (Delta_pr < Delta_p && Delta_sr < Delta_s)
     %     filtru_valid = 1;
     %     return;
     % else
     %    filtru_valid = 0;
     %     return;
     % end
end
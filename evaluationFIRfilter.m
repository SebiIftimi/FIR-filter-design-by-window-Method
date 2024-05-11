function [Delta_pr, Delta_sr] = evaluationFIRfilter(h, omega_p, omega_s)
    
   [H, omega] = freqz(h, 1, 1000, 'whole');  % H is the frequency response, omega are the frequencies
    H = abs(H);  % Calculate the magnitude of the frequency response

    % Extracting passband and stopband
    % Passband: [0, omega_p]
    passband_frequencies = omega <= omega_p;
    H_p = H(passband_frequencies);

    % Stopband: [omega_s, pi]
    stopband_frequencies = omega >= omega_s;
    H_s = H(stopband_frequencies);

    % Calculating maximum deviations
    % Maximum deviation in the passband
    Delta_pr = max(abs(1 - H_p)) * 100;  % Multiply by 100 to express as percentage

    % Maximum deviation in the stopband
    Delta_sr = max(H_s) * 100;  % Multiply by 100 to express as percentage
    
end

% THIS IS PHASE 3 POINT A

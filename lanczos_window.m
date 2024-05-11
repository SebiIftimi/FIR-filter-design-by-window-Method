function wLz = lanczos_window(M, L)
wLz = zeros(M, 1);

for n = 0:M-1
    x = (2 * n - M + 1) / (2 * (M - 1));
    if x == 0
        wLz(n + 1) = 1;
    else
        wLz(n + 1) = (sin(pi * x) / (pi * x)) ^ L;
    end
end

end


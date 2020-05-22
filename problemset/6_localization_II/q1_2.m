% case 1: z = 0, m = 0 (correct measurement)
% case 2: z = 1, m = 0 (wrong measurement)
% case 3: z = 0, m = 1 (wrong measurement)
% case 4: z = 1, m = 1 (correct measurement)

% By Bayes theorem, we want to multiply all P(Zi|Mi).
calcPMeasurement = @(Z, M, pTrueDetection, pFalseDetection) ...
    prod(prod((Z == M)*pTrueDetection + ...
    (Z ~= M)*pFalseDetection));


%% Z-TRANSFORM PROPERTIES VERIFIER
% Project: Z-Transform Properties and IVT/FVT Checker
% Save as: ZTransform_Verifier.m
% Run this file in MATLAB.

clc;
clear;
close all;

fprintf('============================================\n');
fprintf('     Z-TRANSFORM PROPERTIES VERIFIER\n');
fprintf('============================================\n');

%% PART 1: Given signal x[n] = (0.5)^n u[n]

N = 40;
n = -N:N;

% Define the right-sided signal
x = signal(n);

figure('Name','Z-Transform Property Verifier',...
       'NumberTitle','off');

subplot(2,2,1);
stem(n,x,'filled');
title('Original x[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,2);
stem(n,signal(n-1),'filled');
title('Time Shift: x[n-1]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,3);
stem(n,(2.^n).*x,'filled');
title('Z-Scaling: 2^n x[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,4);
stem(n,signal(-n),'filled');
title('Time Reversal: x[-n]');
xlabel('n'); ylabel('Amplitude');
grid on;

% Transform formula for the original signal:
% X(z) = z/(z-0.5), ROC: |z| > 0.5

fprintf('\nPART 1: PROPERTY VERIFICATION\n');
fprintf('Given x[n] = (0.5)^n u[n]\n');
fprintf('X(z) = z/(z - 0.5)\n\n');

% Select a complex test point inside the relevant ROCs
z = 1.5 + 0.2i;
a = 2;

X = ztrans(n,x,z);

% 1. Time shifting
x_shift = signal(n-1);
lhs1 = ztrans(n,x_shift,z);
rhs1 = X/z;

% 2. Z-scaling: a^n*x[n] <-> X(z/a)
x_scale = (a.^n).*x;
lhs2 = ztrans(n,x_scale,z);
rhs2 = ztrans(n,x,z/a);

% 3. Time reversal: x[-n] <-> X(1/z)
x_reverse = signal(-n);
lhs3 = ztrans(n,x_reverse,z);
rhs3 = ztrans(n,x,1/z);

% 4. Differentiation: n*x[n] <-> -z*dX/dz
x_diff = n.*x;
lhs4 = ztrans(n,x_diff,z);

% Numerical derivative of the transform
dz = 1e-5;
dX = (ztrans(n,x,z+dz)-ztrans(n,x,z-dz))/(2*dz);
rhs4 = -z*dX;

fprintf('Test point z = %.2f + %.2fi\n',real(z),imag(z));
fprintf('Time shifting error       = %.3e\n',abs(lhs1-rhs1));
fprintf('Z-scaling error           = %.3e\n',abs(lhs2-rhs2));
fprintf('Time reversal error       = %.3e\n',abs(lhs3-rhs3));
fprintf('Differentiation error     = %.3e\n',abs(lhs4-rhs4));

% Initial and final values for the given signal
Xfun = @(zz) zz./(zz-0.5);
initial = 1;   % limit as z -> infinity
final = 0;     % limit as z -> 1

fprintf('\nInitial Value Theorem: x[0] = %.4f\n',initial);
fprintf('Final Value Theorem:   x[infinity] = %.4f\n',final);

%% PART 2: Initial and Final Value Theorem Checker
% Each system is H(z) = numerator(z)/denominator(z).

names = {
    'Stable: pole at 0.5'
    'Stable: pole at -0.3'
    'Unstable: pole at 1.2'
    'Unit-circle: oscillation'
    'Pole at z = 1'
};

num = {
    [1 0]
    [1 0]
    [1 0]
    [1 0]
    [1 0]
};

den = {
    [1 -0.5]
    [1 0.3]
    [1 -1.2]
    [1 0 1]
    [1 -1]
};

actualFinal = {
    '0'
    '0'
    'Diverges'
    'No limit'
    '1'
};

% Use polynomial degrees for the initial-value limit.
% Evaluate the final-value expression close to z = 1.
epsZ = 1e-6;

fprintf('\n============================================\n');
fprintf('       IVT AND FVT CHECKER: 5 SYSTEMS\n');
fprintf('============================================\n');

fprintf('%-27s %-10s %-12s %-16s\n',...
    'System','h[0] IVT','FVT result','Actual h[infinity]');
fprintf('%s\n',repmat('-',1,70));

ivtResults = zeros(5,1);
fvtResults = zeros(5,1);

for k = 1:5

    b = num{k};
    d = den{k};

    % Initial value: limit H(z) as z -> infinity
    if length(b) < length(d)
        h0 = 0;
    elseif length(b) == length(d)
        h0 = b(1)/d(1);
    else
        h0 = NaN;
    end

    % Final-value formula: limit (z-1)H(z) as z -> 1
    zNear = 1 + epsZ;
    Hnear = polyval(b,zNear)/polyval(d,zNear);
    hf = (zNear-1)*Hnear;

    ivtResults(k) = h0;
    fvtResults(k) = real(hf);

    fprintf('%-27s %-10.4g %-12.4g %-16s\n',...
        names{k},h0,hf,actualFinal{k});
end

%% PART 3: Explain the results

fprintf('\nEXPLANATION:\n');
fprintf('1. Stable poles inside the unit circle: FVT works.\n');
fprintf('2. Pole outside the unit circle: response grows;\n');
fprintf('   FVT can give a wrong answer.\n');
fprintf('3. Unit-circle oscillation: response has no limit;\n');
fprintf('   FVT result is not a valid final value.\n');
fprintf('4. Pole at z=1: usual FVT conditions fail.\n');
fprintf('   This particular sequence still has limit 1.\n');

%% PART 4: Plot predicted versus actual behavior

figure('Name','IVT and FVT Checker',...
       'NumberTitle','off');

for k = 1:5
    subplot(3,2,k);

    nn = 0:25;

    switch k
        case 1
            h = 0.5.^nn;
        case 2
            h = (-0.3).^nn;
        case 3
            h = 1.2.^nn;
        case 4
            h = zeros(size(nn));
            h(2:2:end) = (-1).^(1:length(h(2:2:end)));
            % Exact response: 0, 1, 0, -1, ...
            h = zeros(size(nn));
            h(2:2:end) = (-1).^(0:length(h(2:2:end))-1);
        case 5
            h = ones(size(nn));
    end

    stem(nn,h,'filled');
    title(names{k});
    xlabel('n');
    ylabel('h[n]');
    grid on;
end

fprintf('\nVerification completed successfully.\n');

%% LOCAL FUNCTIONS

function y = signal(k)
    % x[k] = (0.5)^k u[k]
    y = zeros(size(k));
    idx = k >= 0;
    y(idx) = 0.5.^k(idx);
end

function value = ztrans(n,x,z)
    % Finite-sum numerical Z-Transform
    value = sum(x .* z.^(-n));
end

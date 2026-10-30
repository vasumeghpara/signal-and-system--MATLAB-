% Cleaned and Optimized MATLAB Script for Signal Analysis and Fourier Transform
clc;
clear;
close all;

% Define time and frequency vectors
t = -10:0.01:10;
w = -2*pi:0.01:2*pi;

% Define signals and their titles in a cell array
signals = {
    3.^t,       'Exponential Signal';
    sin(t),     'Sinewave';
    t.^2,       'Parabolic Wave'
    };

num_signals = size(signals, 1);

for i = 1:num_signals
    x_t = signals{i, 1};
    sig_title = signals{i, 2};

    % Vectorized Numerical Fourier Transform computation using trapz
    % Integral: X(w) = integral( x(t) * exp(-j*w*t) dt )
    X_k = trapz(t, x_t(:) .* exp(-1j * (t' * w)), 1);

    X_mag = abs(X_k);
    X_angle = angle(X_k);

    % Create Figure
    figure('Name', sig_title, 'NumberTitle', 'off');

    % 1. Time Domain Plot
    subplot(1, 3, 1);
    plot(t, x_t, 'LineWidth', 1.2);
    title(sig_title);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;

    % 2. Magnitude Spectrum
    subplot(1, 3, 2);
    plot(w, X_mag, 'LineWidth', 1.2);
    title(['Magnitude of ', sig_title]);
    xlabel('Frequency \omega (rad/s)');
    ylabel('Magnitude');
    grid on;

    % 3. Phase Spectrum
    subplot(1, 3, 3);
    plot(w, X_angle, 'LineWidth', 1.2);
    title(['Phase of ', sig_title]);
    xlabel('Frequency \omega (rad/s)');
    ylabel('Phase (rad)');
    grid on;
end
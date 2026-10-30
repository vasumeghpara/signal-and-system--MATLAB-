clc;
clear;
close all;

% Time vector
t = -5:0.01:5;

% (i) Sine and Cosine Signals
y1 = sin(2*pi*t);
y2 = cos(2*pi*t);

% (ii) Sinc Function
y3 = sinc(t);

% (iii) Triangle Waveform
y4 = 1 - 2*abs(2*(t-floor(t+0.5)));

% (iv) Rectangular Pulse
y5 = double(abs(t) <= 1);

% (v) Sawtooth Waveform
y6 = 2*(t-floor(t+0.5));

% (vi) Exponential Function
y7 = exp(-abs(t));

% Plotting all signals
figure;

subplot(3,2,1);
plot(t,y1);
title('Sine Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3,2,2);
plot(t,y2);
title('Cosine Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3,2,3);
plot(t,y3);
title('Sinc Function');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3,2,4);
plot(t,y4);
title('Triangle Waveform');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3,2,5);
plot(t,y5);
title('Rectangular Pulse');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(3,2,6);
plot(t,y6);
title('Sawtooth Waveform');
xlabel('Time');
ylabel('Amplitude');
grid on;

figure;
plot(t,y7);
title('Exponential Function');
xlabel('Time');
ylabel('Amplitude');
grid on;

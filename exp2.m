
clc;
clear;
close all;

% Time vector
t = -5:0.01:5;

% 1. Unit Impulse Signal
unit = zeros(size(t));
unit(t == 0) = 1;

% 2. Unit Step Signal u(t)
ustep = zeros(size(t));
ustep(t >= 0) = 1;

% 3. Time Shifting: u(t-2)
u_shift = zeros(size(t));
u_shift(t >= 2) = 1;

% 4. Time Shifting: u(t+2)
u_shift1 = zeros(size(t));
u_shift1(t >= -2) = 1;

% 5. Shifted Ramp Signal r(t-2)
r1 = zeros(size(t));
r1(t >= 2) = t(t >= 2) - 2;

% 6. Ramp Signal r(t)
r2 = zeros(size(t));
r2(t >= 0) = t(t >= 0);

% 7. Exponential Signal
ex = exp(t);

% 8. Sine Signal
s = sin(2*(22/7)*t);

% 9. Time Scaling: r(2t)
r_2t = max(2*t, 0);

% 10. Time Reversal: r(-t)
r_mt = max(-t, 0);

% 11. Signal Subtraction: u(t) - u(t-3)
u_step2 = zeros(size(t));
u_step2(t >= 3) = 1;
u_new = ustep - u_step2;

% Plot all signals

figure;

subplot(4,3,1);
plot(t,u_shift);
title('Shifted Unit Step u(t-2)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,2);
plot(t,u_shift1);
title('Shifted Unit Step u(t+2)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,3);
plot(t,r1);
title('Shifted Ramp r(t-2)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,4);
plot(t,r_2t);
title('Scaled Ramp r(2t)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,5);
plot(t,r_mt);
title('Reversed Ramp r(-t)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,6);
plot(t,u_new);
title('Subtraction: u(t)-u(t-3)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,7);
stem(t,unit);
title('Unit Impulse Signal');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,8);
plot(t,r2);
title('Ramp Signal r(t)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,9);
plot(t,ex);
title('Exponential Signal e^t');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,10);
plot(t,s);
title('Sine Signal');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(4,3,11);
plot(t,ustep);
title('Unit Step u(t)');
xlabel('Time'); ylabel('Amplitude');
grid on;

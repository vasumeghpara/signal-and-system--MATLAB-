
clc;
clear;
close all;

t = -5:0.1:5;

x = sin(t);

x_even = (x + fliplr(x))/2;
x_odd = (x - fliplr(x))/2;

subplot(3,1,1);
plot(t,x);
title('Original Signal');
grid on;

subplot(3,1,2);
plot(t,x_even);
title('Even Signal');
grid on;

subplot(3,1,3);
plot(t,x_odd);
title('Odd Signal');
grid on;

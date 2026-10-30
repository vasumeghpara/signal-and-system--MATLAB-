
clc;
clear;
close all;

t = 0:0.01:10;

x = exp(-t);

E = sum(abs(x).^2)*0.01;
P = E/(t(end)-t(1));

disp(['Energy = ',num2str(E)]);
disp(['Power = ',num2str(P)]);

plot(t,x);
title('Exponential Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

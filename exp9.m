clc;
clear;
close all;

x = [1 2 3 2 1];
y = [1 1 2 1];

% Cross-correlation
[Y1,Y2] = xcorr(x,y);

% Auto-correlation
[X1,X2] = xcorr(x,x);

figure;
subplot(2,1,1);
stem(Y2,Y1,'filled');
grid on;
xlabel('Y2'); ylabel('Y1');
title('Cross-Correlation');

subplot(2,1,2);
stem(X2,X1,'filled');
grid on;
xlabel('X2'); ylabel('X1');
title('Auto-Correlation');

disp('Maximum cross-correlation =');
disp(max(Y1));

disp('Maximum auto-correlation =');
disp(max(X1));
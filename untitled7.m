
clc; clear; close all;
syms z

% Five systems
H = {z/(z-0.5), z/(z+0.3), z/(z-1.2), ...
    z/(z^2+1), z/(z-1)};
names = {'Stable 0.5','Stable -0.3','Unstable 1.2', ...
    'Unit-circle poles','Pole at 1'};

h0 = zeros(5,1);
hf = zeros(5,1);
status = cell(5,1);

figure;

for k = 1:5
    Hz = H{k};

    % Initial and final values
    h0(k) = double(limit(Hz,z,inf));
    hf(k) = double(limit((z-1)*Hz,z,1));

    % Check poles of (z-1)H(z)
    [~,d] = numden(simplify((z-1)*Hz));
    p = double(solve(d==0,z));
    if all(abs(p)<1)
        status{k} = 'Valid';
    else
        status{k} = 'Invalid';
    end

    % Impulse response
    [b,d] = numden(Hz);
    hn = filter(double(sym2poly(b)), ...
        double(sym2poly(d)),[1 zeros(1,25)]);

    subplot(3,2,k);
    stem(0:25,hn,'filled');
    title(names{k}); xlabel('n');
    ylabel('h[n]'); grid on;
end

% Display results
disp('PART B: IVT AND FVT CHECKER');
disp(table(names',h0,hf,status,...
    'VariableNames',{'System','InitialValue','FVTValue','FVTStatus'}));

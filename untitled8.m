clc;
clear;
syms z

X = z/((z-0.8)*(z-0.5));

x0 = limit(X,z,inf);
xf = limit((z-1)*X,z,1);

disp('VIVA: IVT AND FVT');
disp(['Initial Value x[0] = ',char(x0)]);
disp(['Final Value x[infinity] = ',char(xf)]);
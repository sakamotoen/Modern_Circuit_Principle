clc,clear, close all ,format compact

%% 时域变换法
t = 0:0.1:30;                     %设置时间变量
C = 0.5; R = 8;                   %为元件赋值
uc0 = 0; ic0 = 0; ucf= 16;        %设置初始值与电路状态
uc=ucf+(uc0-ucf)*exp(-t/(R*C));   %三要素法求出时域相应
figure(1),plot(t,uc),grid,title('时域响应')

%% 拉普拉斯变换法
syms s                            %定义符号变量
Lf = 16/((4*s+1)*s);              %电路的频域响应
uc_l = ilaplace(Lf,t);            %逆拉普拉斯变换
figure(2),plot(t,uc_l),grid,title('频域法的时域响应')
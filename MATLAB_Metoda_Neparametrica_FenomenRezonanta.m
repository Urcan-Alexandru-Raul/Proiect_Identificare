t = Urcan(:,1); % timp
u = Urcan(:,2); % intrarea
y = Urcan(:,3); % iesirea
%plot(t,u,t,y);

u0 = mean(u(117:119));
y0 = mean(y(121:124));
K = y0/u0;


y_min = 135;
y_max = 143;
u_min = 142;
u_max = 149;

% Mr = (t(y_max)-t(y_min))/(t(u_max)-t(u_min));
Mr = 1.128;
% Z = sqrt(Mr-sqrt(Mr^2-1))/2/Mr;
Z = 0.37;
% Tosc = 2*(t(y_max)-t(y_min));
Tosc = 0.001663;
% wr = (2*pi)/Tosc;
wr = 3.7782e+03;
%wn = wr/sqrt(1-2*Z^2);
wn = 4.3287e+03;

% Validare 
A = [0 1; -wn^2 -2*Z*wn];
B = [0; K*wn^2];
C = [1 0];
D = 0;
sys = ss(A,B,C,D);

ysim = lsim(sys, u-u0, t, [y(1)-y0, (y(2)-y(1))/(t(2)-t(1)-y0)])+y0;
%figure;
plot(t, [y ysim])

empn = norm(y-ysim)/norm(y-mean(y))*100
H = tf(K*wn^2,[1 2*Z*wn wn^2]);
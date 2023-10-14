format long

%% 1. naloga
N = 5026.00; 
b = 0.43;
g = 0.11;

ModelSIR = @(t, x) [-1./N.*b.*x(2).*x(1); 1./N.*b.*x(2).*x(1) - g.*x(2); g.*x(2)];

% 1)
A1 = BDF(ModelSIR, 0, 100, [N-1; 1; 0], 1/4);
%for i = 1:length(A1)
  %  A1(3,i) > A1(2, i) && A1(3,i) > A1(1,i);
%end
%find(A1(3,:) > A1(2, :) & A1(3,:) > A1(1,:))
a1 = A1(3,127);

% 2)
A2 = BDF(ModelSIR, 0, 100, [N-1; 1; 0], 1/2);
b1 = 2*b;
g1 = 2*g;
ModelSIR1 = @(t, x) [-1./N.*b1.*x(2).*x(1); 1./N.*b1.*x(2).*x(1) - g1.*x(2); g1.*x(2)];
A3 = BDF(ModelSIR1, 0, 100, [N-1; 1; 0], 1/2);

maximum1 = max(A2(2,:));
maximum2 = max(A3(2,:));
t1 = find(A2(2,:)==maximum1);
t2 = find(A3(2,:)==maximum2);
razlika = (t1 - t2)/2;

% 3)
ModelSIR2 = @(t, x) [-1./N.*b.*x(2).*x(1); 1./N.*b.*x(2).*x(1) - 0.1*x(2) + 0.00001*x(2)^2; 0.1*x(2) - 0.00001*x(2)^2];
A4 = BDF(ModelSIR2, 0, 100, [N-1; 1; 0], 1/2);
a4 = max(A4(2,:));

% 4)
A5 = BDF(ModelSIR, 0, 100, [N-1; 1; 0], 1);
A6 = BDF_EUL(ModelSIR, 0, 100, [N-1; 1; 0], 1);
a5 = abs(A6(2,end) - A5(2,end));

%% 2. naloga
fun = @(t,y) 1.16.*sin(1.5.^t) + 1.00.*cos(y);

% 1)
y = CashKarp_basic(fun, 0, 10, 0.80, 11/10);

% 2)
[y1, y_tilda1, x1] = CashKarp_basic(fun, 0, 10, 0.80, 1/2);
razlika1 = abs(y1 - y_tilda1);
raz = razlika1(end);

% 3)
[~,y_tilda2] = CashKarp_basic(fun, 0, 5, 0.80, 1/2);
[~,y_tilda3] = CashKarp_basic(fun, 0, 5, 0.80, 1/8);
[~,y_tilda4] = CashKarp_basic(fun, 0, 5, 0.80, 1/64);

p = log(abs(y_tilda4(end) - y_tilda2(end)) / abs(y_tilda4(end) - y_tilda3(end))) / log((1/2)/(1/8));

% 4)
[~, ~, y5, y_tilda5] = CashKarp(fun, 0, 10, 0.80, 1/2, 1e-3);
razlika2 = abs(y5 - y_tilda5);
maximum = max(razlika2);
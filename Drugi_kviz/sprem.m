format long

%% 1. naloga
N = 5000.00; 
b = 0.40;
g = 0.11;

%funS = @(t, S) -1./N.*b.*I.*S;
%funI = @(t,I) 1./N.*b.*I.*S - g.*I;
%funR = @(t,R) g.*I;
%ModelA = {funS; funI; funR};
%ModelA = @(t, S, I, R) [-1./N.*b.*I.*S; 1./N.*b.*I.*S - g.*I; g.*I;];
ModelA = @(t, x) [-1./N.*b.*x(2).*x(1); 1./N.*b.*x(2).*x(1) - g.*x(2); g.*x(2)];
C = (N - g.*N./b.* log(N - 1));
ModelB = @(t, S) -1./N.*b.* (-S + g.*N./b.* log(S) + C).*S;

% 1)
S1 = BDF(ModelB, 0, 50, N-1, 1/10);
s1 = S1(:,end);

% 2)
A1 = BDF(ModelA, 0, 50, [N-1; 1; 0], 1/2);
a1 = A1(2,end);

% 3)
A2 = BDF(ModelA, 0, 25, [N-1; 1; 0], 1/2);
Y0 = A2(:,[end-2 end-1 end]);
b1=b/2;
ModelA1 = @(t, x) [-1./N.*b1.*x(2).*x(1); 1./N.*b1.*x(2).*x(1) - g.*x(2); g.*x(2)];
A3 = BDF(ModelA1, 24, 50, Y0, 1/2);
a3 = A3(2,end);

%% 2. naloga
fun = @(t,y) sin(1.5.^t) + sin(y);

% 1)
[y1, y_tilda1] = CashKarp_basic(fun, 0, 10, 1, 1/2);
razlika = abs(y1(:,2) - y_tilda1(:,2));

% 2)
y2 = CashKarp_basic(fun, 0, 10, 1, 1/10);
y3 = CashKarp_basic(fun, 0, 10, 1, 1/20);
y4 = CashKarp_basic(fun, 0, 10, 1, 1/50);

p = log(abs(y4(:,end) - y2(:,end)) / abs(y4(:,end) - y3(:,end))) / log((1/10)/(1/20));

% 3)
[h, x, y, y_tilda] = CashKarp(fun, 0, 10, 1, 1/10, 1e-8);
kvocient = max(h)/min(h);

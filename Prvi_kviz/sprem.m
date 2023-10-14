format long

%1
fun1 = @(x) sin(1 ./ (x + 0.01));
% 1)
int1 = integral(fun1, 0,1);
as1 = adaptiveSimpson(fun1, 0,1,inf);
ar = abs(int1 - as1)

% 2) in 3)
[as2, gl] = adaptiveSimpson(fun1, 0,1, 1e-3)


%2
fun2 = @(x,y) sin(x - 1/4).^2 .* cos(2.*y -1/3);
% 1)
t1 = trapezno2d(fun2, 0,1,0,1,3,3)

% 2)
t2 = trapezno2d(fun2, 0,1,0,1,30,30);
int2 = integral2(fun2, 0,1,0,1);
p = log(abs(int2 - t1) / abs(t2 - int2)) / log((1/3)/(1/30))

% 3)
kvadrat_simp = simpson2d(fun2, 0,1,0,1,2,3)

% 4)
polarfun1 = @(theta,r) fun2(r.*cos(theta)+0.5,r.*sin(theta)+0.5).*r;
polarfun2 = @(theta,r) fun2(r.*cos(theta)-0.5,r.*sin(theta)+0.5).*r;
polarfun3 = @(theta,r) fun2(r.*cos(theta)-0.5,r.*sin(theta)-0.5).*r;
polarfun4 = @(theta,r) fun2(r.*cos(theta)+0.5,r.*sin(theta)-0.5).*r;

sp1 = simpson2d(polarfun1, 0,pi/2,0,1,3,3);
sp2 = simpson2d(polarfun2, pi/2,pi,0,1,3,3);
sp3 = simpson2d(polarfun3, pi,(3*pi)/2,0,1,3,3);
sp4 = simpson2d(polarfun4, (3*pi)/2,2*pi,0,1,3,3);

s1 = simpson2d(fun2, -1.5,-0.5,-0.5,0.5,3,3);
s2 = simpson2d(fun2, -0.5,0.5,-1.5,-0.5,3,3);
s3 = simpson2d(fun2, -0.5,0.5,-0.5,0.5,3,3);
s4 = simpson2d(fun2, -0.5,0.5,0.5,1.5,3,3);
s5 = simpson2d(fun2, 0.5,1.5,-0.5,0.5,3,3);

osemkotnik_simp = sp1 + sp2 + sp3 + sp4 + s1 + s2 + s3 + s4 + s5
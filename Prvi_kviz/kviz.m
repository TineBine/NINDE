format long

% 1. naloga
fun1 = @(x) sin(1.90./(x+0.01))+1.70.*cos(20.00.*x+1);

% 1)
F=0;
for i = 0:10
    F = F + integral(fun1,0, i/10);
end
sredina = (F/11)

% 2)
integrand = @(x) sqrt(1 + (-34.*sin(20.*x + 1) - (19.*cos(19./(10.*(x + 1./100))))/(10.*(x + 1./100).^2)).^2);
% lok = integral(integrand, 0,1) NAPAČNA REŠITEV
lok = adaptiveSimpson(integrand, 0,1,1e-7) % PRAVILNA REŠITEV

% 3)
as1 = adaptiveSimpson(fun1, 0,1,1e-4);
s1 = 1/6 * (fun1(0) + 4*fun1(0.5) + fun1(1));
razlika1 = abs(as1 - s1)

% 4) NAROBE, NEVEM KAKO JE PRAV
[as2, gl2] = adaptiveSimpson2(fun1, 0,1,2e-2)

% 2. naloga
fun2 = @(x,y) sin(x-1./4.70).^2.*cos(2.10.*y-1/3);

% 1)
trap1 = trapezno2d(fun2,0,2,0,1,20,10);
trap2 = trapezno2d(fun2,0,2,0,1,40,20);
razlika2 = abs(trap1 - trap2)

% 2)
simp1 = simpson2d(fun2,0,2,0,1,10,5);
simp2 = simpson2d(fun2,0,2,0,1,30,15);
int2 = integral2(fun2, 0,2,0,1);
p = log(abs(simp1 - int2) / abs(simp2 - int2)) / log((1/10)/(1/30))

% 3)
polarfun2 = @(theta,r) fun2(r.*cos(theta),r.*sin(theta)).*r;
int3 = integral2(fun2, 0,1,-1,1) - integral2(polarfun2, 0, pi/2,0,1) - integral2(polarfun2,3*pi/2,2*pi,0,1)

% 4) NAKNADNO REŠU
trapfun2 = @(u,v) fun2(u.*(1+v),v).*(1+v);
simp3 = simpson2d(trapfun2, 0,1,0,1,4,4)

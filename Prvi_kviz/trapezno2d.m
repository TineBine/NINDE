function vr = trapezno2d(f,a,b,c,d,n,m)
h = (b-a)/n;
k = (d-c)/m;
x = zeros(n+1,1);
alfa = 2 * ones(n+1,1);
y = zeros(m+1,1);
beta = 2 * ones(m+1,1);

for i = 1:(n)
    x(i+1) = a + i*h;
end
for j = 1:(m)
    y(j+1) = c + j*k;
end

alfa(1) = 1;
alfa(n+1) = 1;
beta(1) = 1;
beta(m+1) = 1;
x(1) = a;
y(1) = c;

vr = 0;
for i = 1:(n+1)
    for j = 1:(m+1)
        vr = vr + alfa(i)*beta(j)*f(x(i),y(j));
    end
end

vr = (h*k)/4 * vr;
end
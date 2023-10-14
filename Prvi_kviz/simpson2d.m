function vr = simpson2d(f,a,b,c,d,n,m)
h = (b-a)/(2*n);
k = (d-c)/(2*m);
x = zeros(2*n+1,1);
alfa = ones(2*n+1,1);
y = zeros(2*m+1,1);
beta = zeros(2*m+1,1);
for i = 1:(2*n)
    x(i+1) = a + i*h;
    if (-1)^i > 0
        alfa(i) = 4;
    else
        alfa(i) = 2;
    end
end
for j = 1:(2*m)
    y(j+1) = c + j*k;
    if (-1)^j > 0
        beta(j) = 4;
    else
        beta(j) = 2;
    end
end
alfa(1) = 1;
alfa(2*n+1) = 1;
beta(1) = 1;
beta(2*m+1) = 1;
x(1) = a;
y(1) = c;
vr = 0;
for i = 1:(2*n+1)
    for j = 1:(2*m+1)
        vr = vr + alfa(i)*beta(j)*f(x(i),y(j));
    end
end
vr = (h*k)/9 * vr;
end
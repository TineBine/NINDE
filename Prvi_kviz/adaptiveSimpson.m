function [x, depth] = adaptiveSimpson(f,a,b,tol)
s=0;
m=(a+b)/2;
left = (m-a)/6 * (f(a) + 4*f((m+a)/2) + f(m));
right = (b-m)/6 * (f(m) + 4*f((m+b)/2) + f(b));
whole = (b-a)/6 * (f(a) + 4*f(m) + f(b)); 
delta = left + right - whole;
tol1 = tol/2;
if abs(delta) <= tol
    s = s + left + right + delta/15;
    depth = 2;
else
    [I1, depth1] = adaptiveSimpson(f,a,m,tol1);
    [I2, depth2] = adaptiveSimpson(f,m,b,tol1);
    s = I1 + I2;
    depth = max(depth1, depth2) + 1;
end
x=s;
end


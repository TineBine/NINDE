function y = BDF(fun, L, D, y_0, h)
    x = L:h:D;
    d = length(y_0);
    y = zeros(d,length(x));
    if width(y_0) == 1
        y(:, 1) = y_0;
        [~, y2] = ode45(fun, [L L+h], y_0);
        y(:, 2) = y2(end,:);
        [~, y3] = ode45(fun, [L L+2*h], y_0);
        y(:, 3) = y3(end,:);
    else
        y(:,[1 2 3]) = y_0;
    end
    for i = 4:length(x)
        fun2 = @(yn) yn - 18/11 * y(:,i-1) + 9/11 * y(:,i-2) - 2/11 * y(:,i-3) - 6/11 * h * fun(x(i), yn);
        y(:,i) = fsolve(fun2, y(:,i-1));
    end
end
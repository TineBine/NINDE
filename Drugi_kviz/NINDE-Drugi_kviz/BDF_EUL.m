function y = BDF_EUL(fun, L, D, y_0, h)
    x = L:h:D;
    d = length(y_0);
    y = zeros(d,length(x));
    if width(y_0) == 1
        y(:, 1) = y_0;
        y(:, 2) = y(:,1)+h*fun(x(1), y(:,1));
        y(:, 3) = y(:,2)+h*fun(x(2), y(:,2));
    else
        y(:,[1 2 3]) = y_0;
    end
    for i = 4:length(x)
        fun2 = @(yn) yn - 18/11 * y(:,i-1) + 9/11 * y(:,i-2) - 2/11 * y(:,i-3) - 6/11 * h * fun(x(i), yn);
        y(:,i) = fsolve(fun2, y(:,i-1));
    end
end
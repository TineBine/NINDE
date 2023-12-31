function [y, y_tilda, x, h] = CashKarp(fun, a, b, y_0, h_0, tol)
    h(1) = h_0;
    x(1) = a;
    y(:, 1) = y_0;
    i=2;
    while x(i-1) + h(i-1) <= b
        k1 = h(i-1) * fun(x(i-1) + 0 * h(i-1), y(:,i-1));
        k2 = h(i-1) * fun(x(i-1) + 1/5 * h(i-1), y(:,i-1) + 1/5 * k1);
        k3 = h(i-1) * fun(x(i-1) + 3/10 * h(i-1), y(:,i-1) + 3/40 * k1 + 9/40 * k2);
        k4 = h(i-1) * fun(x(i-1) + 3/5 * h(i-1), y(:,i-1) + 3/10 * k1 - 9/10 * k2 + 6/5 * k3);
        k5 = h(i-1) * fun(x(i-1) + 1 * h(i-1), y(:,i-1) - 11/54 * k1 + 5/2 * k2 - 70/27 * k3 + 35/27 * k4);
        k6 = h(i-1) * fun(x(i-1) + 7/8 * h(i-1), y(:,i-1) + 1631/55296 * k1 + 175/512 * k2 + 575/13824 * k3 + 44275/110592 * k4 + 253/4096 * k5);
        y_tilda(:,i) = y(:, i-1) + 2825/27648 * k1 + 0 * k2 + 18575/48384 * k3 + 13525/55296 * k4 + 277/14336 * k5 + 1/4 * k6;
        y(:,i) = y(:, i-1) + 37/378 * k1 + 0 * k2 + 250/621 * k3 + 125/594 * k4 + 0 * k5 + 512/1771 * k6;
        x(i) = x(i-1) + h(i-1);
        if x(i-1) + h(i-1) == b
            break
        end
        tol1 = tol * max(y(:,i), y_tilda(:,i));
        err = abs(y(:,i) - y_tilda(:,i)) / tol1;
        h(i) = h(i-1) * (1/err)^(1/5);
        if x(i) + h(i) > b
            h(i) = b - x(i);
        end
        i = i + 1;
    end
end
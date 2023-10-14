function [y, y_tilda, x] = CashKarp_basic(fun, a, b, y_0, h_0)
    h = h_0;
    x = a:h:b;
    d = length(y_0);
    y = zeros(d,length(x));
    y(:, 1) = y_0;
    y_tilda(:,1) = y_0;
    for i = 2:length(x)
        k1 = h * fun(x(i-1) + 0 * h, y(:,i-1));
        k2 = h * fun(x(i-1) + 1/5 * h, y(:,i-1) + 1/5 * k1);
        k3 = h * fun(x(i-1) + 3/10 * h, y(:,i-1) + 3/40 * k1 + 9/40 * k2);
        k4 = h * fun(x(i-1) + 3/5 * h, y(:,i-1) + 3/10 * k1 - 9/10 * k2 + 6/5 * k3);
        k5 = h * fun(x(i-1) + 1 * h, y(:,i-1) - 11/54 * k1 + 5/2 * k2 - 70/27 * k3 + 35/27 * k4);
        k6 = h * fun(x(i-1) + 7/8 * h, y(:,i-1) + 1631/55296 * k1 + 175/512 * k2 + 575/13824 * k3 + 44275/110592 * k4 + 253/4096 * k5);
        y(:,i) = y(:, i-1) + 37/378 * k1 + 0 * k2 + 250/621 * k3 + 125/594 * k4 + 0 * k5 + 512/1771 * k6;

        % zelo slab popravek, ampak dela
        k1_t = h * fun(x(i-1) + 0 * h, y_tilda(:,i-1));
        k2_t = h * fun(x(i-1) + 1/5 * h, y_tilda(:,i-1) + 1/5 * k1_t);
        k3_t = h * fun(x(i-1) + 3/10 * h, y_tilda(:,i-1) + 3/40 * k1_t + 9/40 * k2_t);
        k4_t = h * fun(x(i-1) + 3/5 * h, y_tilda(:,i-1) + 3/10 * k1_t - 9/10 * k2_t + 6/5 * k3_t);
        k5_t = h * fun(x(i-1) + 1 * h, y_tilda(:,i-1) - 11/54 * k1_t + 5/2 * k2_t - 70/27 * k3_t + 35/27 * k4_t);
        k6_t = h * fun(x(i-1) + 7/8 * h, y_tilda(:,i-1) + 1631/55296 * k1_t + 175/512 * k2_t + 575/13824 * k3_t + 44275/110592 * k4_t + 253/4096 * k5_t);
        y_tilda(:,i) = y_tilda(:, i-1) + 2825/27648 * k1_t + 0 * k2_t + 18575/48384 * k3_t + 13525/55296 * k4_t + 277/14336 * k5_t + 1/4 * k6_t;
    end
    if x(end) ~= b
        k1 = (b - x(end)) * fun(x(end) + 0 * (b - x(end)), y(:,end));
        k2 = (b - x(end)) * fun(x(end) + 1/5 * (b - x(end)), y(:,end) + 1/5 * k1);
        k3 = (b - x(end)) * fun(x(end) + 3/10 * (b - x(end)), y(:,end) + 3/40 * k1 + 9/40 * k2);
        k4 = (b - x(end)) * fun(x(end) + 3/5 * (b - x(end)), y(:,end) + 3/10 * k1 - 9/10 * k2 + 6/5 * k3);
        k5 = (b - x(end)) * fun(x(end) + 1 * (b - x(end)), y(:,end) - 11/54 * k1 + 5/2 * k2 - 70/27 * k3 + 35/27 * k4);
        k6 = (b - x(end)) * fun(x(end) + 7/8 * (b - x(end)), y(:,end) + 1631/55296 * k1 + 175/512 * k2 + 575/13824 * k3 + 44275/110592 * k4 + 253/4096 * k5);
        y_tilda(:,end+1) = y(:, end) + 2825/27648 * k1 + 0 * k2 + 18575/48384 * k3 + 13525/55296 * k4 + 277/14336 * k5 + 1/4 * k6;
        y(:,end+1) = y(:, end) + 37/378 * k1 + 0 * k2 + 250/621 * k3 + 125/594 * k4 + 0 * k5 + 512/1771 * k6;
    end
end
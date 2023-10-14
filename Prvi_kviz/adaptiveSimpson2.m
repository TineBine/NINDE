function [val, maxLevel] = adaptiveSimpson2(f,a,b,tol)
% function [val, maxLevel] = adaptiveSimpson(f,a,b,tol)
%
% Rekurzivna adaptivna metoda za \int_a^b f(x) dx, ki temelji na
% Simpsonovem pravilu in Richardsonovi ekstrapolaciji.
% Metoda izracuna priblizek I_1 za integral po Simpsonovem pravilu na
% [a,b]. Nato primerja rezultat z I_2, ki da dobimo s Simpsonovim pravilom
% na dveh enako velikih podintervalih. 
% Ce je |I_1 - I_2| vecja od tol*(b-a), potem na vsakem od podintervalov
% rekurzivno poklicemo metodo in vrnemo priblizek za integral kot vsoto
% obeh prispevkov.
% Ce je razlika |I1 - I2| manjsa oz. enaka kot zahtevana natancnost
% tol*(b-a), le se izboljsamo rezultat tako, da naredimo en korak
% Richardsonove ekstrapolacije.
%
% Vhodni podatki
% funkcija f,
% interval [a, b]
% natancnost tol. 
%
% Izhodni podatki
% priblizek za integral
% najvecja dosezena globina rekurzije

h = (b-a)/2;
I1 = h/3 * (f(a)+4*f(a+h)+f(a+2*h));
h1 = h/2;
I2 = h1/3 * (f(a)+4*f(a+h1)+f(a+2*h1)) + h1/3 * (f(a+2*h1)+4*f(a+3*h1)+f(a+4*h1));
if abs(I1-I2) > tol*(b-a)
    [I1, lvl1] = adaptiveSimpson2(f,a,a+h,tol);
    [I2, lvl2] = adaptiveSimpson2(f,a+h,b,tol);
    maxLevel = max(lvl1, lvl2) + 1;
    val = I1 +I2;
elseif abs(I1-I2) <= tol*(b-a)
    maxLevel = 2;
    val = (2^4 * I2 - I1)/(2^4 - 1);
else

end

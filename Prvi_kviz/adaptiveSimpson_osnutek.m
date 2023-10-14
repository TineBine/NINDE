function [val, maxLevel] = adaptiveSimpson(f,a,b,tol)
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
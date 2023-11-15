% cautaElement(L: integer*, E: integer)
% L - lista in care cautam elementul
% E - elementul de cautat
% Model de flux: (i, i)

cautaElement([], _) :- fail.
cautaElement([E | _], E) :- !.
cautaElement([_ | T], E) :- cautaElement(T, E).

% diferentaMultimi(M1: list, M2: list, Rez: list)
% M1 - multime de numere intregi
% M2 - multime de numere intregi
% Rez - rezultatul M1 / M2
% Model de flux: (i, i, o), (i, i, i), (o, i, i), (i, o, i)

diferentaMultimi([], _, []) :- !.
diferentaMultimi([H | T], [], [H | T]) :- !.
diferentaMultimi([H | T], M2, Rez) :-
    cautaElement(M2, H),
    !,
    diferentaMultimi(T, M2, Rez).
diferentaMultimi([H | T], M2, [H | Rez]) :- diferentaMultimi(T, M2, Rez).

% adaugaDupaPare(L: list, Rez: list)
% L - lista de numere intregi
% Rez - lista rezultata dupa ce adaugam valoarea 1 dupa fiecare numar
% par
% Model de flux : (i, o), (i, i)

adaugaDupaPare([], []) :- !.
adaugaDupaPare([H | T], [H, 1 | Rez]) :-
    H mod 2 =:= 0,
    !,
    adaugaDupaPare(T, Rez).
adaugaDupaPare([H | T], [H | Rez]) :- adaugaDupaPare(T, Rez).

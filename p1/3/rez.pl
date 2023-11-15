% cautaElement(L: list, E: integer)
% L - lista
% E - element de cautat
% Model de flux: (i, i)

cautaElement([], _) :- fail.
cautaElement([E | _], E).
cautaElement([_ | T], E) :- cautaElement(T, E).

% adaugaFinal(L: integer, E: element, Rez: list)
% L - lista
% E - element de adaugat
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

adaugaFinal([], E, [E]).
adaugaFinal([H | T], E, [H | Rez]) :- adaugaFinal(T, E, Rez).

% listToSet(L: list, Col: list, Rez: list)
% L - lista
% Col - lista colectoare
% Rez - L transformata in set
% Model de flux: (i, i, o), (i, i, i)

listToSet([], Col, Col) :- !.
listToSet([H | T], Col, Rez) :-
    cautaElement(Col, H),
    !,
    listToSet(T, Col, Rez).
listToSet([H | T], Col, Rez) :-
    adaugaFinal(Col, H, ColRez),
    listToSet(T, ColRez, Rez).

% listToSetMain(L: list, Rez: list)
% L - lista
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

listToSetMain([], []) :- !.
listToSetMain(L, Rez) :- listToSet(L, [], Rez).

% extragePare(L: list, RezPare: list, NrPare: integer)
% L - lista de numere intregi
% RezPare - lista cu numerele pare din L
% NrPare - numarul de elemente ale lui RezPare
% Model de flux: (i, o, o), (i, i, i)

extragePare([], [], 0).
extragePare([H | T], [H | RezPare], NrPare) :-
    H mod 2 =:= 0,
    !,
    extragePare(T, RezPare, NrPareNew),
    NrPare is NrPareNew + 1.
extragePare([_ | T], RezPare, NrPare) :- extragePare(T, RezPare, NrPare).

% extrageImpare(L: list, RezImpare: list, NrImpare: integer)
% L - lista
% RezImpare - lista cu numerele impare din L
% NrImpare - numarul de elemente ale lui RezImpare
% Model de flux: (i, o, o), (i, i, i)

extrageImpare([], [], 0).
extrageImpare([H | T], [H | RezImpare], NrImpare) :-
    H mod 2 =:= 1,
    !,
    extrageImpare(T, RezImpare, NrImpareNew),
    NrImpare is NrImpareNew + 1.
extrageImpare([_ | T], RezImpare, NrImpare) :- extrageImpare(T, RezImpare, NrImpare).

% separareParitate(L: list, Rez: list, NrPare: integer, NrImpare:
% integer)
% L - lista de numere intregi
% Rez - lista rezultat
% NrPare - numarul de numere pare
% NrImpare - numarul de numere impare
% din lista NrImpare - numerele impare din lista

separareParitate([], [], 0, 0).
separareParitate(L, Rez, NrPare, NrImpare) :-
    LC = L,
    extragePare(LC, Pare, NrPare),
    LC = L,
    extrageImpare(LC, Impare, NrImpare),
    Rez = [Pare, Impare].














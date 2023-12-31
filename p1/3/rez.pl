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

% extrage(L: list, Paritate: integer, Rez: list, NrPare: integer)
% L - lista de numere intregi
% Paritate - paritatea numerelor
% Rez - lista rezultat
% NrPare - numarul de elemente
% Model de flux: (i, i, o, o), (i, i, i, i)

extrage([], _,[], 0).
extrage([H | T], Paritate, [H | Rez], NrPare) :-
    H mod 2 =:= Paritate,
    !,
    extrage(T, Paritate, Rez, NrPareNew),
    NrPare is NrPareNew + 1.
extrage([_ | T], Paritate, Rez, NrPare) :- extrage(T, Paritate, Rez, NrPare).

% separareParitate(L: list, Rez: list, NrPare: integer, NrImpare:
% integer)
% L - lista de numere intregi
% Rez - lista rezultat
% NrPare - numarul de numere pare
% NrImpare - numarul de numere impare
% din lista NrImpare - numerele impare din lista

separareParitate([], [], 0, 0).
separareParitate(L, Rez, NrPare, NrImpare) :-
    extrage(L, 0, Pare, NrPare),
    extrage(L, 1, Impare, NrImpare),
    Rez = [Pare, Impare].














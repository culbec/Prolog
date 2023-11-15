% cautaElement(L: list, E: integer)
% L - lista de numere intregi
% E - element de cautat
% Model de flux: (i, i)

cautaElement([], _) :- fail.
cautaElement([E | _], E).
cautaElement([_ | T], E) :- cautaElement(T, E).

% reuniune(M1: list, M2: list, Rez: lista rezultat)
% M1 - multime de numere intregi
% M2 - multime de numere intregi
% Rez - multime rezultat
% Model de flux: (i, i, o), (i, i, i)

% am ales sa fac reuniunea adaugand elementele lipsa din M2 la inceputul
% lui M1 = M2 U M1

reuniune(M1, [], M1) :- !.
reuniune(M1, [H | T], Rez) :-
    cautaElement(M1, H),
    !,
    reuniune(M1, T, Rez).
reuniune(M1, [H | T], [H | Rez]) :- reuniune(M1, T, Rez).

% perechi(L : list, E: atom, Rez: list)
% L - lista de atomi
% E - atom
% Rez - lista rezultat cu toate perechile
% Model de flux: (i, o), (i, i)

perechi([], _, []).
perechi([H | T], E, [[E, H] | Rez]) :-
    perechi(T, E, Rez).

% adaugaInceputPerechi(P: list, L: list, Rez: list)
% P - lista de perechi
% L - lista de adaugat in P
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

adaugaInceputPerechi([], L, L).
adaugaInceputPerechi([H | T], L, [H | Rez]) :-
    adaugaInceputPerechi(T, L, Rez).

% multimePerechi(L: list, Rez: list)
% L - lista de atomi
% Rez - lista rezultata
% Model de flux: (i, o), (i, i)

multimePerechi([], []).
multimePerechi([H | T], Rez) :-
    perechi(T, H, Perechi),
    multimePerechi(T, RRez),
    % append(Perechi, Rest, Rez).
    adaugaInceputPerechi(Perechi, RRez, Rez).











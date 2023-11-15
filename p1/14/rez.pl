% cautaElement(L: list, E: element)
% L - lista
% E - element de cautat in L
% Model de flux: (i, i)

cautaElement([E | _], E) :- !.
cautaElement([_ | T], E) :- cautaElement(T, E).

% lungime(L: list, K: integer)
% L - lista
% K - lungimea listei L
% Model de flux: (i, o), (i, i)

lungime([], 0).
lungime([_ | T], K) :-
    lungime(T, KNew),
    K is KNew + 1.

% egalitateMultimi(M1: set, M2: set)
% M1 - multime
% M2 - multime
% Model de flux: (i, i)

egalitateMultimi(M1, M2) :-
    lungime(M1, K1),
    lungime(M2, K2),
    K1 =:= K2.
egalitateMultimi([], [_]) :- !.
egalitateMultimi([H | T], M2) :-
    cautaElement(M2, H),
    egalitateMultimi(T, M2).

% selecteazaPozitie(L: list, I: integer, N: integer, Elem: integer)
% L - lista de numere intregi
% I - index curent
% N - pozitie de selectat
% Elem - elementul selectat de pe pozitia N
% Model de flux: (i, i, i, o), (i, i, i, i)

selecteazaPozitie([H | _], I, N, H) :-
    I =:= N,
    !.
selecteazaPozitie([_ | T], I, N, Elem) :-
    INew is I + 1,
    selecteazaPozitie(T, INew, N, Elem).

% selecteazaPozitieMain(L: list, N: integer, Elem: integer)
% L - lista de numere intregi
% N - pozitie de selectat
% Elem - elementul selectat de pe pozitia N
% Model de flux: (i, i, o), (i, i, i)

selecteazaPozitieMain(L, N, Elem) :- selecteazaPozitie(L, 1, N, Elem).

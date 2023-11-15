% totalPar(L: list, Indicator: string)
% L - lista de numere intregi
% Indicator - indicator care ne indica paritatea totalului de numere
% Model de flux: (i, i).

totalPar([], par).
totalPar([_ | T], par) :-
    totalPar(T, impar),
    !.
totalPar([_ | T], impar) :-
    totalPar(T, par).

% numarPar(L: list)
% L - lista de numere intregi
% Model de flux: (i)

numarPar(L) :- totalPar(L, par).

% cautaMinim(L: list, Min: elem)
% L - lista de numere intregi
% Min - minimul din L
% Model de flux: (i, o), (i, i)

cautaMinim([H], H).
cautaMinim([H | T], H) :-
    cautaMinim(T, Min),
    H < Min,
    !.
cautaMinim([_ | T], Min) :-
    cautaMinim(T, Min).

% eliminarePrimulMinim(L: list, Eliminat: integer, Min: integer, Rez:
% list)
% L - lista de intregi
% Eliminat - indica daca s-a eliminat prima aparitie
% Min - minimul din L model
% Rez - lista rezultat
% Model de flux: (i, i, i, o), (i, i, i, i)

eliminarePrimulMinim([], _, _, []).
eliminarePrimulMinim([H | T], 0, Min, Rez) :-
    H =:= Min,
    !,
    eliminarePrimulMinim(T, 1, Min, Rez).
eliminarePrimulMinim([H | T], 1, Min, [H | Rez]) :-
    eliminarePrimulMinim(T, 1, Min, Rez).

% eliminareMain(L: list, Rez: list)
% L - lista de intregi
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

eliminareMain([], []) :- !.
eliminareMain([_], []) :- !.
eliminareMain(L, Rez) :-
    cautaMinim(L, Min),
    eliminarePrimulMinim(L, 0, Min, Rez).

% inverseaza(L: list, Col: list, Rez: list)
% L - lista de elemente
% Col - colectoare
% Rez - reversed(L)
% Model de flux: (i, i, o), (i, i, i)

inverseaza([], Col, Col) :- !.
inverseaza([H | T], Col, Rez) :-
    inverseaza(T, [H | Col], Rez), !.

% produs(X: list, Y: int, Carry: int, Rez: list)
% X - numar reprezentat ca lista
% Y - cifra cu care se inmulteste X
% Carry - transportul
% Rez - X * Y
% Model de flux: (i, i, i, o), (i, i, i, i)

produs([], _, 0, []) :- !.
produs([], _, Carry, [Carry]) :- !.
produs([H | T], Y, Carry, [Cif | Rez]) :-
    P is H * Y + Carry,
    Cif is P mod 10,
    Rest is P // 10,
    CarryNew is Rest mod 10,
    produs(T, Y, CarryNew, Rez).

% produsMain(X: list, Y: int, Rez: list)
% X - numar reprezentat ca lista
% Y - cifra cu care se inmulteste X
% Rez - X * Y
% Model de flux: (i, i, o), (i, i, i)

produsMain([], _, []) :- !.
produsMain(X, Y, Rez) :-
    inverseaza(X, [], XR),
    produs(XR, Y, 0, RezR),
    inverseaza(RezR, [], Rez).

% inlocEterogen(L: list, Curr: int, Rez: list)
% L - lista eterogena
% Curr - indicele sublistei de numere curente
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

inlocEterogen([], _, []).
inlocEterogen([H | T], Curr, [H | Rez]) :-
    \+is_list(H),
    !,
    inlocEterogen(T, Curr, Rez).
inlocEterogen([H | T], Curr, [HP | Rez]) :-
    produsMain(H, Curr, HP),
    CurrNew is Curr + 1,
    inlocEterogen(T, CurrNew, Rez),
    !.

% inlocEterogenMain(L: list, Rez: list)
% L - lista eterogena
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

inlocEterogenMain([], []) :- !.
inlocEterogenMain(L, Rez) :-
    inlocEterogen(L, 1, Rez).






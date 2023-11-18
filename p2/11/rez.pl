% prim(X: int, D: int)
% X - numar intreg
% D - numar natural, posibil divizor al lui X
% Model de flux: (i, i)

prim(X, D) :-
    D > X // 2,
    !.
prim(X, D) :-
    X mod D =\= 0,
    !,
    DNew is D + 1,
    prim(X, DNew).

% primMain(X: int)
% X - numar intreg
% Model de flux: (i)

primMain(X) :-
    X > 1,
    prim(X, 2).

% dubleazaPrim(L: list, Rez: list)
% L - lista de numere intregi
% Rez - L cu numere prime dublate
% Model de flux: (i, o), (i, i)

dubleazaPrim([], []).
dubleazaPrim([H | T], [H, H | Rez]) :-
    primMain(H),
    !,
    dubleazaPrim(T, Rez).
dubleazaPrim([H | T], [H | Rez]) :-
    dubleazaPrim(T, Rez),
    !.

% dubleazaEterogen(L: list, Rez: list)
% L - lista eterogena
% Rez - L in care sublistele au numere prime dublate
% Model de flux: (i, o), (i, i)

dubleazaEterogen([] ,[]).
dubleazaEterogen([H | T], [H | Rez]) :-
    \+is_list(H),
    !,
    dubleazaEterogen(T, Rez).
dubleazaEterogen([H | T], [HDublat | Rez]) :-
    dubleazaPrim(H, HDublat),
    dubleazaEterogen(T, Rez),
    !.

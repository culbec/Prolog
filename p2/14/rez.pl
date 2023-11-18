% predecesor(X: list, Imprumut: int, Rez: list)
% X: numar sub forma de lista
% Imprumut: indicator daca s-a facut imprumut
% Rez: X - 1
% Model de flux: (i, o, o), (i, i, i)

predecesor([H], 1, [9]) :-
    Cif is H - 1,
    Cif < 0,
    !.
predecesor([H], 0, [Cif]) :-
    Cif is H - 1,
    !.
predecesor([H | T], 1, [9 | Rez]) :-
    predecesor(T, Imprumut, Rez),
    Cif is H - Imprumut,
    Cif < 0,
    !.
predecesor([H | T], 0, [Cif | Rez]) :-
    predecesor(T, Imprumut, Rez),
    Cif is H - Imprumut,
    !.

% predecesorMain(X: list, Rez: list)
% X: numar reprezentat ca lista
% Rez: X - 1
% Model de flux: (i, o), (i, i)

predecesorMain([], []) :- !.
predecesorMain([X], [X]) :-
    X =< 0,
    !.
predecesorMain(X, Rez) :-
    predecesor(X, 0, Rez),
    !.

% predecesorEterogen(L: list, Rez: list)
% L: lista eterogena
% Rez: lista rezultat
% Model de flux: (i, o), (i, i)

predecesorEterogen([], []).
predecesorEterogen([H | T], [H | Rez]) :-
    \+is_list(H),
    !,
    predecesorEterogen(T, Rez).
predecesorEterogen([H | T], [Pred | Rez]) :-
    predecesorMain(H, Pred),
    predecesorEterogen(T, Rez),
    !.

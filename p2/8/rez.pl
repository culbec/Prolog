% succesor(X: list, Carry: int, Rez: list)
% X - numar reprezentat ca lista
% Carry - transport
% Rez - X + 1
% Model de flux: (i, o, o), (i, i, i)

succesor([H], 1, [Cif]) :-
    S is H + 1,
    S >= 10,
    !,
    Cif is S mod 10.
succesor([H], 0, [Cif]) :-
    Cif is H + 1,
    !.
succesor([H | T], 1, [Cif | Rez]) :-
    succesor(T, Carry, Rez),
    S is H + Carry,
    S >= 10,
    !,
    Cif is S mod 10.
succesor([H | T], 0, [Cif | Rez]) :-
    succesor(T, Carry, Rez),
    Cif is H + Carry,
    !.

% succesorMain(X: list, Rez: list)
% X - numar in format de lista
% Rez - X + 1 in format de lista
% Model de flux: (i, o), (i, i)

succesorMain([], []) :- !.
succesorMain(X, [1 | Rez]) :-
    succesor(X, Carry, Rez),
    Carry =:= 1,
    !.
succesorMain(X, Rez) :-
    succesor(X, Carry, Rez),
    Carry =:= 0,
    !.

% succesorEterogen(L: list, Rez: list)
% L - lista eterogena
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

succesorEterogen([], []).
succesorEterogen([H | T], [H | Rez]) :-
    \+is_list(H),
    !,
    succesorEterogen(T, Rez).
succesorEterogen([H | T], [Succesor | Rez]) :-
    succesorMain(H, Succesor),
    succesorEterogen(T, Rez),
    !.

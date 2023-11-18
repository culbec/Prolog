% eliminaSecvente(L: list, Succesiv: int, Rez: list)
% L - lista de numere intregi
% Succesiv - indicator pentru secventa succesiva
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

eliminaSecvente([_], 1, []) :- !.
eliminaSecvente([H], 0, [H]) :- !.
eliminaSecvente([H1, H2 | T], 0, Rez) :-
    H1 =:= H2 - 1,
    !,
    eliminaSecvente([H2 | T], 1, Rez).
eliminaSecvente([H1, H2 | T], 0, [H1 | Rez]) :-
    eliminaSecvente([H2 | T], 0, Rez),
    !.
eliminaSecvente([H1, H2 | T], 1, Rez) :-
    H1 =\= H2 - 1,
    !,
    eliminaSecvente([H2 | T], 0, Rez).
eliminaSecvente([_, H2 | T], 1, Rez) :-
    eliminaSecvente([H2 | T], 1, Rez),
    !.

% eliminaMain(L: list, Rez: list)
% L - lista de numere intregi
% Rez - L din care se scot toate secventele consecutive
% Model de flux: (i, o), (i, i)

eliminaMain([], []) :- !.
eliminaMain(L, Rez) :-
    eliminaSecvente(L, 0, Rez),
    !.

% eliminaEterogene(L: list, Rez: list)
% L - lista eterogena
% Rez - L in care toate secventele succesive din sublistele de numere
% sunt eliminate
% Model de flux: (i, o), (i, i)

eliminaEterogene([], []).
eliminaEterogene([H | T], [H | Rez]) :-
    \+is_list(H),
    !,
    eliminaEterogene(T, Rez).
eliminaEterogene([H | T], [HNew | Rez]) :-
    eliminaMain(H, HNew),
    eliminaEterogene(T, Rez),
    !.

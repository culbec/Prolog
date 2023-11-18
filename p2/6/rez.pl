% adaugaSfarsit(L: list, E: elem, Rez: list)
% L - lista
% E - elementul de adaugat
% Rez - L (+) E
% Model de flux: (i, i, o), (i, i, i)

adaugaSfarsit([], E, [E]) :- !.
adaugaSfarsit([H | T], E, [H | Rez]) :-
    adaugaSfarsit(T, E, Rez).

% adaugaSublista(L: list, LElems: list, Rez: list)
% L - lista
% LElems - lista cu element de adaugat
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

adaugaSublista(L, [], L) :- !.
adaugaSublista(L, [H | T], Rez) :-
    adaugaSfarsit(L, H, LNew),
    adaugaSublista(LNew, T, Rez).

% inlocuireElement(L: list, E: elem, LElems: list, Col: list Rez: list)
% L - lista de element
% E - elementul de inlocuit
% LElems - lista cu care se inlocuieste elementul
% Col - colectoare
% Rez - lista rezultat
% Model de flux: (i, i, i, i, o), (i, i, i, i, i)

inlocuireElement([], _, _, Col, Col) :- !.
inlocuireElement([H | T], E, LElems, Col, Rez) :-
    H =:= E,
    !,
    adaugaSublista(Col, LElems, ColNew),
    inlocuireElement(T, E, LElems, ColNew, Rez).
inlocuireElement([H | T], E, LElems, Col, Rez) :-
    adaugaSfarsit(Col, H, ColNew),
    inlocuireElement(T, E, LElems, ColNew, Rez).

% inlocuireElementMain(L: list, E: elem, LElems: list, Rez: list)
% L - lista
% E - element de inlocuit
% LElems - lista de elemente cu care se va inlocui E
% Rez: lista rezultat
% Model de flux: (i, i, i, o), (i, i, i, i)

inlocuireElementMain([], _, _, []) :- !.
inlocuireElementMain(L, E, LElems, Rez) :-
    inlocuireElement(L, E, LElems, [], Rez).

% primElement(L: list, E: element)
% L - lista
% E - primul element al listei
% Model de flux: (i, o), (i, i)

primElement([H | _], H).

% inlocEterogen(L: list, LElems: list, Rez: list)
% L - lista eterogena
% LElems - lista de elemente
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

inlocEterogen([], _, []).
inlocEterogen([H | T], LElems, [HNew | Rez]) :-
    is_list(H),
    !,
    primElement(H, E),
    inlocuireElementMain(H, E, LElems, HNew),
    inlocEterogen(T, LElems, Rez).
inlocEterogen([H | T], LElems, [H | Rez]) :-
    inlocEterogen(T, LElems, Rez).







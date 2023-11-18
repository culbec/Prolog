% merge(X: list, Y: list, Rez: list)
% X - lista de numere intregi
% Y - lista de numere intregi
% Rez - X, Y interclasare
% Model de flux: (i, i, o), (i, i, i)

merge([], [], []) :- !.
merge(X, [], X) :- !.
merge([], Y, Y) :- !.
merge([XH | XT], [YH | YT], [XH | Rez]) :-
    XH < YH,
    !,
    merge(XT, [YH | YT], Rez).
merge(X, [YH | YT], [YH | Rez]) :-
    merge(X, YT, Rez),
    !.

% exista(L: list, E: element)
% L - lista
% E - element
% Model de flux: (i, o), (i, i)

exista([E | _], E).
exista([_ | T], E) :-
    exista(T, E).

% adaugaSfarsit(L: list, E: element, Rez: list)
% L - lista
% E - element de adaugat
% Rez - Lista + E
% Model de flux: (i, i, o), (i, i, i)

adaugaSfarsit([], E, [E]).
adaugaSfarsit([H | T], E, [H | Rez]) :-
    adaugaSfarsit(T, E, Rez).

% eliminaDubluri(L: list, Col: list, Rez: list)
% L - lista
% Col - colectoare
% Rez - L fara dubluri
% Model de flux: (i, i, o), (i, i, i)

eliminaDubluri([], Col, Col).
eliminaDubluri([H | T], Col, Rez) :-
    \+exista(Col, H),
    !,
    adaugaSfarsit(Col, H, ColNew),
    eliminaDubluri(T, ColNew, Rez).
eliminaDubluri([_ | T], Col, Rez) :-
    eliminaDubluri(T, Col, Rez).

% interclasareSubliste(L: list, Curr: list, Rez: list)
% L - lista eterogena
% Curr - lista interclasata curenta
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

interclasareSubliste([], Curr, Curr) :- !.
interclasareSubliste([H | T], Curr, Rez) :-
    is_list(H),
    !,
    merge(H, Curr, CurrNew),
    interclasareSubliste(T, CurrNew, Rez).
interclasareSubliste([_ | T], Curr, Rez) :-
    interclasareSubliste(T, Curr, Rez).

% interclasareSublisteMain(L: list, Rez: list)
% L - lista eterogena
% Rez - sublistele din L interclasate
% Model de flux: (i, o), (i, i)

interclasareSublisteMain([], []) :- !.
interclasareSublisteMain(L, Rez) :-
    interclasareSubliste(L, [], RezNew),
    eliminaDubluri(RezNew, Rez).


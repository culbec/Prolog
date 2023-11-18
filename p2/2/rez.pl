% merge(X: list, Y: list, Rez: list)
% X: lista de numere
% Y: lista de numere
% Rez: lista rezultat
% Model de flux: (i, i, o), (i, i, i)

merge([], [], []) :- !.
merge(X, [], X) :- !.
merge([], Y, Y) :- !.
merge([XH | XT], [YH | YT], [XH | Rez]) :-
    XH < YH,
    !,
    merge(XT, [YH| YT], Rez).
merge([XH | XT], [YH | YT], [YH | Rez]) :-
    merge([XH | XT], YT, Rez).

% split(L: list, Left: list, Right: list)
% L - lista de numere intregi
% Left - lista din stanga mijlocului
% Right - lista din dreapta mijlocului
% Model de flux: (i, o, o), (i, i, i)

split([], [], []).
split([X], [X], []).
split([X, Y | Rest], [X | XRest], [Y | YRest]) :-
    split(Rest, XRest, YRest).

% mergeSort(L: list, Rez: list)
% L - lista de numere
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

mergeSort([], []) :- !.
mergeSort([H], [H]) :- !.
mergeSort(L, Rez) :-
    split(L, Left, Right),
    mergeSort(Left, SortedLeft),
    mergeSort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Rez),
    !.

% sortareListe(L: list, Rez: list)
% L - lista eterogena
% Rez - lista L in care se sorteaza listele de numere din ea
% Model de flux: (i, o), (i, i)

sortareListe([], []).
sortareListe([H | T], [H | Rez]) :-
    number(H),
    !,
    sortareListe(T, Rez).
sortareListe([H | T], [SortedH | Rez]) :-
    is_list(H),
    !,
    mergeSort(H, SortedH),
    sortareListe(T, Rez).







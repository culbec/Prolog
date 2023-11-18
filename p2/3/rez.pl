% merge(X: list, Y: list, Rez: list)
% X - lista de numere intregi
% Y - lista de numere intregi
% Rez - lista interclasata
% Model de flux: (i, i, o), (i, i, i)

merge([], [], []) :- !.
merge(X, [], X) :- !.
merge([], Y, Y) :- !.
merge([XH | XT], [YH | YT], [XH | Rez]) :-
    XH < YH,
    !,
    merge(XT, [YH | YT], Rez).
merge([XH | XT], [YH | YT], [YH | Rez]) :-
    merge([XH | XT], YT, Rez).

% split(L: list, Left: list, Right: list)
% L - lista de numere intregi
% Left - partitie a lui L
% Right - partitie a lui L
% Model de flux: (i, o, o) - nedeterminist , (i, i, i)

split([], [], []) :- !.
split([X], [], [X]) :- !.
split([X, Y | Rest], [X | XRest], [Y | YRest]) :-
    split(Rest, XRest, YRest),
    !.

% mergeSort(L: list, Rez: list)
% L - lista de numere intregi
% Rez - lista L sortata
% Model de flux: (i, o), (i, i)

mergeSort([], []) :- !.
mergeSort([H], [H]) :- !.
mergeSort(L, Rez) :-
    split(L, Left, Right),
    mergeSort(Left, SortedLeft),
    mergeSort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Rez),
    !.

% exists(L: list, E: intreg)
% L - lista
% E - element
% Model de flux: (i, o) - nedeterminist, (i, i)

exists([E | _], E).
exists([_ | T], E) :-
    exists(T, E).

% eliminaDubluri(L: list, Rez: list)
% L - lista
% Rez - lista L fara dubluri
% Model de flux: (i, o), (i, i)

eliminaDubluri([], []) :- !.
eliminaDubluri([H | T], Rez) :-
    eliminaDubluri(T, Rez),
    exists(Rez, H),
    !.
eliminaDubluri([H | T], [H | Rez]) :-
    eliminaDubluri(T, Rez).

% mergeSortMain(L: list, Rez: list)
% L - lista de numere
% Rez - lista L sortata
% Model de flux: (i, o), (i, i)

mergeSortMain([], []) :- !.
mergeSortMain(L, Rez) :-
    eliminaDubluri(L, LNew),
    mergeSort(LNew, Rez).

% sortareListe(L: list, Rez: list)
% L - lista eterogena
% Rez - lista L care are sublistele de numere sortate
% Model de flux: (i, o), (i, i)

sortareListe([], []) :- !.
sortareListe([H | T], [SortH | Rez]) :-
    is_list(H),
    !,
    mergeSortMain(H, SortH),
    sortareListe(T, Rez).
sortareListe([H | T], [H | Rez]) :-
    sortareListe(T, Rez).

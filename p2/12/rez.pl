% inloc(L: list, E: element, EI: element, Rez: list)
% L - lista
% E - element de inlocuit
% EI - element cu care se inlocuieste
% Rez - L in care se inlocuieste E cu EI
% Model de flux: (i, i, i, o), (i, i, i, i)

inloc([], _, _, []).
inloc([E | T], E, EI, [EI | Rez]) :-
    inloc(T, E, EI, Rez),
    !.
inloc([H | T], E, EI, [H | Rez]) :-
    inloc(T, E, EI, Rez),
    !.

% cautaMaxEterogen(L: list, MaxCurr: int, Max)
% L: lista eterogena
% MaxCurr: maximul curent
% Max: elementul maxim dintre numerele intregi ale lui L
% Model de flux: (i, i, o), (i, i, i)

cautaMaxEterogen([], MaxCurr, MaxCurr) :- !.
cautaMaxEterogen([H | T], MaxCurr, Max) :-
    number(H),
    MaxCurr >= H,
    !,
    cautaMaxEterogen(T, MaxCurr, Max).
cautaMaxEterogen([H | T], _, Max) :-
    number(H),
    cautaMaxEterogen([H | T], H, Max),
    !.
cautaMaxEterogen([_ | T], MaxCurr, Max) :-
    cautaMaxEterogen(T, MaxCurr, Max),
    !.

% firstNumber(L: list, X: int)
% L - lista eterogena
% X - primul numar din L
% Model de flux: (i, o), (i, i)

firstNumber([H | _], H) :-
    number(H), !.
firstNumber([_ | T], X) :-
    firstNumber(T, X).

% inlocEterogen(L: list, Max: int, Rez: list)
% L: lista eterogena
% Max: maximul dintre valorile intregi ale lui L
% Rez: L in care se inlocuiesc in toate sublistele maximul sublistei cu
% maximul Max
% Model de flux: (i, i, o), (i, i, i)

inlocEterogen([], _, []).
inlocEterogen([H | T], Max, [H | Rez]) :-
    \+is_list(H),
    !,
    inlocEterogen(T, Max, Rez).
inlocEterogen([H | T], Max, [HNew | Rez]) :-
    firstNumber(H, MaxCurr),
    cautaMaxEterogen(H, MaxCurr, MaxH),
    inloc(H, Max, MaxH, HNew),
    inlocEterogen(T, Max, Rez),
    !.

% inlocEterogenMain(L: list, Rez: list)
% L: lista eterogena
% Rez: L in care se inlocuiesc in toate sublistele maximul sublistei cu
% maximul Max
% Model de flux: (i, o), (i, i)

inlocEterogenMain([], []) :- !.
inlocEterogenMain(L, Rez) :-
    firstNumber(L, MaxCurr),
    cautaMaxEterogen(L, MaxCurr, Max),
    inlocEterogen(L, Max, Rez),
    !.

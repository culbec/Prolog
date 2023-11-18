% cautaMaxim(L: list, Max: int)
% L - lista de numere intregi
% Max - elementul maxim din lista
% Model de flux: (i, o), (i, i)

cautaMaxim([H], H).
cautaMaxim([H | T], Max) :-
    cautaMaxim(T, Max),
    Max >= H,
    !.
cautaMaxim([H | T], H) :-
    cautaMaxim(T, Max),
    Max < H,
    !.

% pozMax(L: list, Max: int, I: int, Rez: list)
% L - lista de numere intregi
% Max - elementul maxim din L
% I - indicele curent
% Rez - lista rezultat care contine pozitiile maximului
% Model de flux: (i, i, i, o), (i, i, i, i)

pozMax([], _, _, []).
pozMax([H | T], Max, I, [I | Rez]) :-
    H =:= Max,
    !,
    INew is I + 1,
    pozMax(T, H, INew, Rez).
pozMax([_ | T], Max, I, Rez) :-
    INew is I + 1,
    pozMax(T, Max, INew, Rez).

% pozMaxMain(L: list, Rez: list)
% L - lista de intregi
% Rez - lista cu pozitiile maximului din L
% Model de flux: (i, o), (i, i)

pozMaxMain([], []) :- !.
pozMaxMain(L, Rez) :-
    cautaMaxim(L, Max),
    pozMax(L, Max, 1, Rez).

% inlocuireListe(L: list, Rez: list)
% L - lista eterogena
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

inlocuireListe([], []).
inlocuireListe([H | T], [MaxPos | Rez]) :-
    is_list(H),
    !,
    pozMaxMain(H, MaxPos),
    inlocuireListe(T, Rez).
inlocuireListe([H | T], [H | Rez]) :-
    inlocuireListe(T, Rez).



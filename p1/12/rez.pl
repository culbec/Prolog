% inlocuire(L: list, E: atom, ENew: atom, Rez: list)
% L - lista de atomi
% E - atom de inlocuit
% ENew - atomul cu care se inlocuieste
% Rez - lista rezultat
% Model de flux: (i, i, i, o), (i, i, i, i)

inlocuire([], _, _, []).
inlocuire([E | T], E, ENew, [ENew | Rez]) :-
    inlocuire(T, E, ENew, Rez),
    !.
inlocuire([H | T], E, ENew, [H | Rez]) :-
    inlocuire(T, E, ENew, Rez).

% lungime(L: list, K: integer)
% L - lista de numere intregi
% K - lungimea listei L
% Model de flux: (i, o), (i, i)

lungime([], 0).
lungime([_ | T], K) :-
    lungime(T, KNew),
    K is KNew + 1.

% sublista(L: list, I: integer, M: integer, N: integer, Rez: list)
% L - lista de intregi
% I - index curent
% M - limita inferioara a sublistei
% N - limita superioara a sublistei
% Rez - lista rezultat
% Model de flux: (i, i, i, i, o), (i, i, i, i, i)

sublista([], _, _, _, []).
sublista([H | T], I, M, N, [H | Rez]) :-
    I >= M,
    I =< N,
    !,
    INew is I + 1,
    sublista(T, INew, M, N, Rez).
sublista([_ | T], I, M, N, Rez) :-
    INew is I + 1,
    sublista(T, INew, M, N, Rez).

% sublistaMain(L: list, M: integer, N: integer, Rez: list)
% L - lista de intregi
% M - limita inferioara a sublistei
% N - limita superioara a sublistei
% Rez - lista rezultat
% Model de flux: (i, i, i, o), (i, i, i, i)

sublistaMain([], _, _, []) :- !.
sublistaMain(L, M, N, Rez) :-
    sublista(L, 1, M, N, Rez).

% intercalare(L: list, E: integer, I: integer, P: integer, Rez: list)
% L - lista de intregi
% E - element de intercalat
% I - index curent
% P - pozitie pe care se intercaleaza
% Rez - lista rezultat
% Model de flux: (i, i, i, i, o), (i, i, i, i, i)

intercalare([], _, _ , _, []).
intercalare([H | T], E, I, P, [H, E | Rez]) :-
    I =:= P,
    !,
    INew is I + 1,
    intercalare(T, E, INew, P, Rez).
intercalare([H | T], E, I, P, [H | Rez]) :-
    INew is I + 1,
    intercalare(T, E, INew, P, Rez).

% intercalareMain(L: list, E: integer, P: integer, Rez: list)
% L - lista de numere intregi
% E - element de intercalat
% P - pozitia unde se intercaleaza
% Rez - lista rezultat
% Model de flux: (i, i, i, o), (i, i, i, i)

intercalareMain([], _, _, []) :- !.
intercalareMain(L, E, P, Rez) :- intercalare(L, E, 1, P, Rez).

% cmmdc(A: integer, B: integer, CMMDC)
% A - numar intreg
% B - numar intreg
% CMMDC - cmmdc(A, B)
% Model de flux: (i, i, o), (i, i, i)

cmmdc(A, 0, A) :- !.
cmmdc(A, B, CMMDC) :-
    A >= B,
    !,
    R is A mod B,
    cmmdc(B, R, CMMDC).
cmmdc(A, B, CMMDC) :-
    A < B,
    cmmdc(B, A, CMMDC).

% cmmdcLista(L: list, CMMDC: list)
% L - lista de numere intregi
% CMMDC - cmmdc(L)
% Model de flux: (i, o), (i, i)

cmmdcLista([], -1) :- !.
cmmdcLista([H], H).
cmmdcLista([H | T], CMMDC) :-
    cmmdcLista(T, CMMDCNew),
    cmmdc(H, CMMDCNew, R),
    CMMDC is R,
    !.

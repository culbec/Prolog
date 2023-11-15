% cmmdc(A: integer, B: integer, Rez: integer)
% A - numar intreg
% B - numar intreg
% Rez - cmmdc(A, B)
% Model de flux: (i, i, o), (i, i, i), (o, i, i), (i, o, i)

cmmdc(A, 0, A) :- !.
cmmdc(A, B, Rez) :-
    A >= B,
    !,
    R is A mod B,
    cmmdc(B, R, Rez).
cmmdc(A, B, Rez) :-
    A < B,
    cmmdc(B, A, Rez).

% cmmmc(L: integer*, Rez: integer)
% L - lista de numere intregi
% Rez - cmmmc al numerelor din L
% Model de flux: (i, o), (i, i)

cmmmc([], -1) :- !.
cmmmc([H], H) :- !.
cmmmc([H | T], Rez) :-
    cmmmc(T, Aux),
    Prod is H * Aux,
    cmmdc(H, Aux, C),
    Rez is Prod // C.

% adaugaElement(L: list, V: integer, I: integer, P: integer, Rez: list)
% L - lista de numere intregi
% V - valoarea de adaugat in lista
% I - indicele curent
% P - pozitia pentru adaugat
% Rez - lista rezultata
% Model de flux: (i, i, i, i, o), (i, i, i, i, i)

adaugaElement([], _, _, _, []).
adaugaElement([H | T], V, I, P, [H, V | Rez]) :-
    I =:= P,
    !,
    INew is I + 1,
    PNew is P * 2,
    adaugaElement(T, V, INew, PNew, Rez).
adaugaElement([H | T], V, I, P, [H | Rez]) :-
    INew is I + 1,
    adaugaElement(T, V, INew, P, Rez).

% adaugaElementMain(L : list, V: integer, Rez: list)
% L - lista de numere intregi
% V - valoarea de adaugat in lista
% Rez - lista rezultata
% Model de flux: (i, i, o), (i, i, i)

adaugaElementMain([], _, []) :- !.
adaugaElementMain(L, V, Rez) :- adaugaElement(L, V, 1, 1, Rez).

% Aparitii(L: E*, E: integer, A: integer)
% L - lista cu elemente de tipul lui E
% E - elementul caruia ii calculam aparitiile
% A - variabila in care calculam aparitiile lui E in L
% Model de flux: (i, i, o) - determinist sau (i, i, i) - determinist,
% pentru teste

aparitii([], _, 0).
aparitii([E | T], E, ATotal) :-
    aparitii(T, E, A),
    ATotal is A + 1, !. % nu mai cautam alte aparitii
aparitii([H| T], E, ATotal) :-
    aparitii(T, E, ATotal),
    H \= E.

% eliminaRepetate(L: list, LCopie: list, Rez: list)
% L - lista de elemente
% LCopie - copia lui L pentru a gasi elementele care se repeta
% Rez - lista cu elementele ce nu se repeta din L
% Model de flux: (i, o) - determinist, (i, i) - determinist, pentru
% teste

eliminaRepetate([], _, []).
eliminaRepetate([H | T], LCopie, [H | Rez]) :-
    aparitii(LCopie, H, AH),
    AH = 1,
    !, % stim ca numarul apare deja o singura data
    eliminaRepetate(T, LCopie, Rez).
eliminaRepetate([_| T], LCopie, Rez) :- eliminaRepetate(T, LCopie, Rez).

% eliminaRepetateMain(L: list, R: list)
% - wrapper pentru functia principala
% L - lista de elemente
% R - lista rezultat
% Model de flux: (i, o)

eliminaRepetateMain([], []) :- !.
eliminaRepetateMain([H | T], Rez) :- eliminaRepetate([H | T], [H | T], Rez).

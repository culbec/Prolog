% cautaElement(L: list, E: integer)
% L - lista de intregi
% E - element de cautat
% Model de flux: (i, i)

cautaElement([], _) :- fail.
cautaElement([E | _], E) :- !.
cautaElement([_ | T], E) :- cautaElement(T, E).


% verificaMultime(M: list)
% M - multime?
% Model de flux: (i)

verificaMultime([]).
verificaMultime([H | T]) :-
    MC = T,
    \+cautaElement(MC, H),
    verificaMultime(T).

% elimina3Aparitii(L: list, E: integer, Apar: integer, Rez: list)
% L - lista de numere intregi
% E - element de sters
% Apar = 3 aparitii
% Rez - lista rezultat
% Model de flux: (i, i, i, o), (i, i, i, i)

elimina3Aparitii([], _, _, []).
elimina3Aparitii([E | T], E, Apar, Rez) :-
    Apar > 0,
    !,
    AparNew is Apar - 1,
    elimina3Aparitii(T, E, AparNew, Rez).
elimina3Aparitii([E | T], E, Apar, [E | Rez]) :-
    !,
    elimina3Aparitii(T, E, Apar, Rez).
elimina3Aparitii([H | T], E, Apar, [H | Rez]) :-
    elimina3Aparitii(T, E, Apar, Rez).

% elimina3AparitiiMain(L: list, E: integer, Rez: list)
% L - lista de intregi
% E - element de sters
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

elimina3AparitiiMain([], _, []).
elimina3AparitiiMain(L, E, Rez) :- elimina3Aparitii(L, E, 3, Rez).

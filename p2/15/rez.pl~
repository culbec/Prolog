% secventaPare(L: list, Secv: list, K: int) :-
% L: lista de numere intregi
% Secv: secventa para curenta
% K: lungimea secventei
% Model de flux: (i, i, o), (i, i, i)

secventaPare([], [], 1) :- !.
secventaPare([H | _], [], 1) :-
    H mod 2 =\= 0,
    !.
secventaPare([H | T], [H | Secv], K) :-
    secventaPare(T, Secv, KN),
    K is KN + 1,
    !.

% secvParMax(L: list, Secv: list, K: int, Rez: list)
% L: lista de numere intregi
% Secv: secventa de lg maxima curenta
% K: lungimea secventei
% Rez: secventa de numere pare maxima
% Model de flux: (i, i, i, o), (i, i, i, i)

secvParMax([], Secv, _, Secv) :- !.
secvParMax([H | T], _, K, Rez) :-
    H mod 2 =:= 0,
    secventaPare(T, SecvTemp, KC),
    SecvC = [H | SecvTemp],
    KC > K,
    !,
    secvParMax(T, SecvC, KC, Rez).
secvParMax([H | T], Secv, K, Rez) :-
    H mod 2 =:= 0,
    secvParMax(T, Secv, K, Rez).
secvParMax([_ | T], Secv, K, Rez) :-
    secvParMax(T, Secv, K, Rez),
    !.

% secvParMaxMain(L: list, Rez: list)
% L - lista
% Rez - secv pare de lg max
% Model de flux: (i, o), (i, i)

secvParMaxMain([], []) :- !.
secvParMaxMain(L, Rez) :-
    secvParMax(L, [], 0, Rez),
    !.

% secvEterogen(L: list, Rez: list)
% L - lista eterogena
% Rez - lista rezultat
% Model de flux: (i, o), (i, i)

secvEterogen([], []).
secvEterogen([H | T], [H | Rez]) :-
    \+is_list(H),
    !,
    secvEterogen(T, Rez).
secvEterogen([H | T], [Secv | Rez]) :-
    secvParMaxMain(H, Secv),
    secvEterogen(T, Rez),
    !.

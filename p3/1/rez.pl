% candidat(L: list, E: elem, Rest: list)
% L - lista de elemente
% E - element extras din L
% Rest - restul listei
% Model de flux: (i, o, o) - nedeterminsit, (i, i, i) - determinist

candidat([E | T], E, T).
candidat([_ | T], E, Rest) :-
    candidat(T, E, Rest).

% valid(L: list, E: elem)
% L - lista de puncte in plan (minim 2)
% E - punct in plan
% => sunt punctele coliniare?
% Model de flux: (i, i) - determinist

valid([X, _], [X, _], [X, _]) :- !.
valid([_, Y], [_, Y], [_, Y]) :- !.
valid([X1, Y1], [X2, Y2], [X3 , Y3]) :-
    Det is X1 * (Y3 - Y2) - X2 * (Y3 - Y1) + X3 * (Y2 - Y1),
    Det =:= 0.

% coliniare(L: list, Col: list, Rez: list)
% L - lista de puncte
% Col - lista colectoare
% Rez - submultime de puncte coliniare
% Model de flux: (i, i, o) - nedet. (i, i, i) - det.

coliniare(_, [P1, P2 | Col], [P1, P2 | Col]).
coliniare(L, [P1, P2 | Col], Rez) :-
    candidat(L, E, RestE), % extragem un candidat si continutul dupa acesta
    \+candidat([P1, P2 | Col], E, _), % verificam sa nu fi extras deja candidatul
    valid(P1, P2, E), % verificam daca candidatul ales este valid
    coliniare(RestE, [E, P1, P2 | Col], Rez). % continuam generarea solutiilor

% coliniareMain(L: list, Rez: list)
% L - lista de puncte in plan
% Rez - lista rezultat
% Model de flux: (i, o) - nedet., (i, i) - det.

coliniareMain(L, Rez) :-
    candidat(L, P1, Rest1), % P1 + sublista de la P1
    candidat(Rest1, P2, Rest2), % P2 + sublista de la P2
    P1 \= P2,
    coliniare(Rest2, [P1, P2], Rez). % restul solutiilor se vor alege din L / {[... | P1], P2}

% coliniareCollect(L: list, Rez: list)
% L - lista de puncte in plan
% Rez - lista rezultat
% Model de flux: (i, o) - nedet., (i, i) - det.

coliniareCollect(L) :-
    findall(R, coliniareMain(L, R), Rez), % colectam toate solutiile (Colector, predicatColector, Bag)
    afisareRezultat(Rez).

% afisareRezultat(L: list)
% L - lista rezultate
% Model de flux: (i) - det.

afisareRezultat([]) :- !.
afisareRezultat([H | T]) :-
    write(H), nl,
    afisareRezultat(T).

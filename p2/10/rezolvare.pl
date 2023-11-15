% adaugaElement(L: list, E: integer, I: integer, P: integer, Rez: list)
% L - lista de numere intregi
% E - elementul care se adauga
% I - index-ul curent
% P - pozitia dupa care se va adauga elementul
% Rez - lista rezultata
% Model de flux: (i, i, i, i, o) sau (i, i, i, i, i) - test

adaugaElement([], _, _, _, []).
adaugaElement([H | T], E, I, P, [H | Rez]) :-
    I \= P,
    !, % doar in acest caz continuam fara adaugare
    INew is I + 1,
    adaugaElement(T, E, INew, P, Rez).
adaugaElement([H | T], E, I, P, [H, E | Rez]) :-
    INew is I + 1,
    PNew is 2*P + 1,
    adaugaElement(T, E, INew, PNew, Rez).

% adaugaElementMain(L: list, E: integer, Rez: list)
% L - lista de numere intregi
% E - elementul de adaugat
% Rez - lista rezultata
% Model de flux: (i, i, o) sau (i, i, i) - test

adaugaElementMain([], _, []) :- !. % daca avem lista vida, iesim.
adaugaElementMain([H | T], E, Rez) :- adaugaElement([H | T], E, 1, 1, Rez).

% adaugaInListe(L: list, Rez: list)
% L - lista eterogena formata din elemente de tip numere intregi si
% liste de numere intregi
% Rez - lista rezultat
% Model de flux: (i, o) sau (i, i) - test.

adaugaInListe([], []).
adaugaInListe([H], [H]).
adaugaInListe([H1, H2 | T], [H1, RezNew | Rez]) :-
    number(H1), % nu este necesar din ce reiese din enuntul problemei
    is_list(H2), % necesar din enuntul problemei
    !, % doar in aceste conditii va putea rula algoritmul, nu este necesar backtracking
    adaugaElementMain(H2, H1, RezNew),
    adaugaInListe(T, Rez).
adaugaInListe([H1, H2 | T], [H1, H2 | Rez]) :-
    adaugaInListe(T, Rez).

% Teste pentru punctul a)

test_adaugaElementMain :-
    adaugaElementMain([], 42, Rez1),
    write('Test 1: '), write(Rez1), nl,
    !,

    adaugaElementMain([1, 2, 3, 4, 5, 6, 7, 8, 9], 42, Rez2),
    write('Test 2: '), write(Rez2), nl,
    !,

    adaugaElementMain([1, 2, 3, 4], 42, Rez3),
    write('Test 3: '), write(Rez3), nl,
    !,

    adaugaElementMain([42, 42, 42], 42, Rez4),
    write('Test 4: '), write(Rez4), nl,
    !,

    adaugaElementMain([7, 14, 21, 28, 35], 42, Rez5),
    write('Test 5: '), write(Rez5), nl.

% Teste pentru punctul b)

test_adaugaInListe :-
    adaugaInListe([1, [2, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5], Rez1),
    write('Test 1: '), write(Rez1), nl,
    !,

    adaugaInListe([1, 2, 3], Rez2),
    write('Test 2: '), write(Rez2), nl,
    !,

    adaugaInListe([], Rez3),
    write('Test 3: '), write(Rez3), nl,
    !,

    adaugaInListe([6, 5, 4, [1, 2, 3], 5, [6, 5, 1, 4, 5], 8, 9], Rez4),
    write('Test 4: '), write(Rez4), nl,
    !,

    adaugaInListe([-1, [1], -5, [], 0], Rez5),
    write('Test 5: '), write(Rez5), nl.

% cautaMaxim(L: list, Max: integer)
% L - lista de numere intregi
% Max - variabila care va contine numarul maxim
% Model de flux: (i, o) - determinist, (i, i) - determinist, pentru
% teste

cautaMaxim([], -1).
cautaMaxim([H], H) :- !.
cautaMaxim([H | T], H) :-
    cautaMaxim(T, TempMax),
    H >= TempMax,
    !.
cautaMaxim([_ | T], Max) :- cautaMaxim(T, Max).
/*cautaMaxim([H | T], Max) :-
    cautaMaxim(T, TempMax),
    H < TempMax,
    !,
    Max = TempMax. */
/*cautaMaxim([H | T], Max) :-
    cautaMaxim(T, TempMax),
    H >= TempMax,
    Max = H. */

% eliminaMaxim(L: list, Rez: list, Max: integer)
% L - lista de numere intregi
% Rez - lista rezultat
% Max - maximul din lista
% Model de flux: (i, i, o, i) - determinist, (i, i, i, i) - determinist
% pentru teste

eliminaMaxim([], [], _) :- !.
eliminaMaxim([H | T], [H | Rez], Max) :-
    H \= Max,
    !,
    eliminaMaxim(T, Rez, Max).
eliminaMaxim([_ | T], Rez, Max) :- eliminaMaxim(T, Rez, Max).

% eliminaMaximMain(L: list)
% L - lista de numere intregi
% - wrapper
% Model de flux: (i, o) - determinist

eliminaMaximMain([], []) :- !.
eliminaMaximMain([H | T], Rez) :-
    cautaMaxim([H | T], Max), !,
    eliminaMaxim([H | T], Rez, Max).


% vale(L: list, Sens: integer)
% L - lista de numere intregi
% Sens - sensul cresterii:
% * 0 - coborare;
% * 1 - crestere;
% Model de flux: (i)

vale([_], 1).
vale([H1, H2 | T], 0) :-
    H1 < H2,
    vale([H2 | T], 1),
    !.
vale([H1, H2 | T], 1) :-
    H1 < H2,
    vale([H2 | T], 1),
    !.
vale([H1, H2 | T], 0) :-
    H1 > H2,
    vale([H2 | T], 0),
    !.

% sumaAlternanta(L: list, S: integer, Semn: integer)
% L - lista de numere intregi
% S - suma alternanta a lui L
% Semn - indicator pentru semn:
% * 0 = +;
% * 1 = -;
% Model de flux: (i, o), (i, i)

sumaAlternanta([], 0, _).
sumaAlternanta([H | T], S, 0) :-
    sumaAlternanta(T, SNew, 1),
    S is SNew + H,
    !.
sumaAlternanta([H | T], S, 1) :-
    sumaAlternanta(T, SNew, 0),
    S is SNew - H.

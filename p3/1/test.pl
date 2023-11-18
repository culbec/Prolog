test1 :-
    L = [
        [1, 1], [2, 2], [3, 3], [4, 4], [5, 11]
    ],
    write("Test 1: "), nl,
    coliniareCollect(L),
    nl.

test2 :-
    L = [
        [1, 1], [2, 2], [3, 3], [4, 4], [5, 5],
        [-1, 6], [-1, 4], [1, 4], [11, 9], [12, 11]
    ],
    write("Test 2: "), nl,
    coliniareCollect(L),
    nl.


test3 :-
    L = [[1, 1]],
    write("Test 3: "), nl,
    coliniareCollect(L),
    nl.


test4 :-
    L = [],
    write("Test 4: "), nl,
    coliniareCollect(L),
    nl.


test5 :-
    L = [
        [1, 1], [2, 4], [39, 11], [-50, 110], [-6, 5],
        [26, 6], [-10, 5], [91, 60], [10, 11], [11, 11]
    ],
    write("Test 5: "), nl,
    coliniareCollect(L),
    nl.


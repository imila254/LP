/* Ingrida Milaševaitė, 3 kursas, 1 grupė */


/*
4.
Domino kauliukų dėstymas.
Duotas domino kauliukų sąrašas. Nustatykite, kaip galima sudėti juos į uždarą grandinę.
*/

domino(Listas) :- domino_seka(Listas,Rezultatas) , ar_uzdaras(Rezultatas), !, braizyti(Rezultatas), !.


domino_seka(Listas, Rezultatas) :- domino_seka(Listas, _, Rezultatas).

domino_seka([], _, []) :- !.
domino_seka(Seka, X, [X-Y | Rez]) :-
    select(Kauliukas, Seka, Likutis),
    ar_tinka(Kauliukas, X-Y),
    domino_seka(Likutis, Y, Rez).

ar_tinka(X-Y, X-Y).
ar_tinka(X-Y, Y-X).

ar_uzdaras([X1-_|Likutis]) :- last(Likutis, _-Yn), X1==Yn.


braizyti([]).
braizyti([X|List]) :-
    write(X),nl,
    braizyti(List).

/*
Užklausų pvz.:

domino_seka([5-4, 1-2, 4-3, 2-3], R).
false.

domino([5-4, 1-2, 4-3, 2-3]).
false.

?- domino([1-5,5-3,3-2,4-2,4-1,6-1,1-6]).
1-5
5-3
3-2
2-4
4-1
1-6
6-1

domino_seka([1-2,4-5],R).
false.

domino([1-2,4-5]).
false.
*/


/* Ingrida Milaševaitė, 3 kursas, 1 grupė */
/* 1.3; 2.6; 3.2; 4.9 */


/*
1.3.
progr(S) - teisingas, kai visi duoto sveikųjų skaičių sąrašo S elementai sudaro aritmetinę progresiją. Pavyzdžiui:
?- progr([1,4,7,10]).
*/

progr(S) :- skirtumai(S,_), !.


skirtumai( [_], _Rezultatas).
skirtumai( [], _Rezultatas).

skirtumai( [X,  Y | Likutis], Rezultatas):-
    Rezultatas is Y - X,
    skirtumai( [Y | Likutis], Rezultatas).

/*
UŽKLAUSŲ PVZ.:

?- skirtumai([1,4,7,10],R).
R = 3 ;

?- progr([1,6,4,2,7]).
false.

?- progr([1,4,7,10]).
true .

?- progr([5,10,15,20]).
true .

*/


/*
2.6.
kart(S,K,E) - sąraše S yra K vienas po kito einančių vienodų elementų E. Pavyzdžiui:
?- kart([a,a,c,a,b,b,b,b,a,g],4,E).
E = b.
*/

kart(S,K,E) :- poaibis(S,I,K), elementas_pagal_indeksa(S,I,E). 

/*
poaibis(Sarasas, Indeksas, Ilgis).
*/

poaibis([H|T], Indeksas, Ilgis) :- poaibis(T, 1-1-H, Indeksas, Ilgis).

poaibis([H1|T], Indeksas0-Ilgis0-H0, Indeksas, Ilgis) :-
    H0 == H1, !,
    NaujasIlgis is Ilgis0 + 1,
    poaibis(T,Indeksas0-NaujasIlgis-H0, Indeksas, Ilgis).

poaibis(_, Indeksas-Ilgis-_, Indeksas, Ilgis) :- Ilgis > 1.

poaibis([H|T], Indeksas0-Ilgis0-_, Indeksas, Ilgis) :-
    NaujasIndeksas is Indeksas0 + Ilgis0,
    poaibis(T, NaujasIndeksas-1-H, Indeksas, Ilgis).

/*
elementas_pagal_indeksa(Sarasas, Indeksas, Elementas).
*/

elementas_pagal_indeksa([S], 1, S).
elementas_pagal_indeksa([H|_], 1, H).
elementas_pagal_indeksa([_|T], Indeksas, Elementas) :- 
                                                    NaujasIndeksas is Indeksas-1,
                                                    elementas_pagal_indeksa(T,NaujasIndeksas,Elementas).


/*
UŽKLAUSŲ PVZ.:
?- poaibis([a,b,b,b,c],I,3).
I = 2 .

?- poaibis([b,b,b,c],I,3).
I = 1 .

?- poaibis([b,b,b,c],1,X).
X = 3 .

?- poaibis([b,b,b,c,c],4,X).
X = 2.


?- elementas_pagal_indeksa([a,b,c],X,a).
X = 1 .

?- elementas_pagal_indeksa([a,b,c],2,X).
X = b .


?- kart([a,a,c,a,b,b,b,b,a,g],2,E).
E = a .

?- kart([a,a,c,a,b,b,a,g],2,E).
E = a ;
E = b ;

*/


/*
3.2.
bendri(S1,S2,R) - sąrašas R susideda iš bendrų duotųjų sąrašų S1 ir S2 elementų. Pavyzdžiui:
?- bendri([a,b,c,d],[d,b,e],R).
R = [b,d].
*/


bendri([], _, []).
bendri([H|T], S2, [H|S1]):- priklauso_sarasui(H, S2), !, bendri(T, S2, S1).
bendri([_|T], S2, S1):-  bendri(T, S2, S1).

priklauso_sarasui(X, [X|_]).
priklauso_sarasui(X, [_|Tail]) :- priklauso_sarasui(X,Tail).


/*
UŽKLAUSŲ PVZ.:
?- bendri([a,b,c,d,e],[d,b,e],R).
R = [b, d, e].

?- bendri([],[d,b,e],R).
R = [].

?- bendri([a,b,c,d,e],[],R).
R = [].

?- bendri([],[],R).
R = [].
*/

/*
4.9.
didesnis(S1,S2) - S1 ir S2 yra skaičiai vaizduojami skaitmenų sąrašais. 
Predikatas didesnis(S1,S2) teisingas tada ir tiktai data, kai pirmasis skaičius yra didesnis už antrąjį. 
Pavyzdžiui:
?- didesnis([1,4,6,1,3,4],[9,8]).
true.
*/

didesnis(S1,S2) :-
            listas_i_skaiciu(S1, R1), listas_i_skaiciu(S2,R2), R1>R2.

listas_i_skaiciu(Listas, Rezultatas) :- listas_i_skaiciu(Listas, 0, Rezultatas).

listas_i_skaiciu([H|T], Prefix, Rezultatas) :-
    Prefix1 is Prefix * 10 + H,
    listas_i_skaiciu(T, Prefix1, Rezultatas).

listas_i_skaiciu([], Rezultatas, Rezultatas).


/*
UŽKLAUSŲ PVZ.:
?- didesnis([9,8],[9,8]).
false.

?- didesnis([9,8,1],[9,8]).
true.

?- didesnis([0,9,8],[9,8]).
false.

?- didesnis([0,0,9,8],[9,8]).
false.

?- didesnis([0,0,9,8],[8]).
*/
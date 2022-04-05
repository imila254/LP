/* Ingrida Milaševaitė, 3 kursas, 1 grupė */
/* 2.6; 5.1 */

/* studentas(Vardas, Kursas); */
studentas(jonas, 1).
studentas(simas, 1).
studentas(skaiste, 1).

studentas(petras, 2).
studentas(neptunas, 2).
studentas(rokas, 2).

studentas(migle, 3).
studentas(vytautas, 3).

studentas(lukas, 4).
studentas(birute, 4).
studentas(jokubas, 4).

/* yraVyresnis(StudentoVardas1, StudentoVardas2). */

yraVyresnis(jokubas, birute).
yraVyresnis(birute, rokas).
yraVyresnis(rokas, lukas).
yraVyresnis(lukas, vytautas).
yraVyresnis(vytautas, migle).
yraVyresnis(migle, neptunas).
yraVyresnis(neptunas, petras).
yraVyresnis(petras, skaiste).
yraVyresnis(skaiste, simas).
yraVyresnis(simas, jonas).

/*__________________________________________________________________________________________________________________*/


yraVyresnisX(StudentoVardas1, StudentoVardas2) :- yraVyresnis(StudentoVardas1, StudentoVardas2).
yraVyresnisX(StudentoVardas1, StudentoVardas3) :- 
                                                yraVyresnis(StudentoVardas1, StudentoVardas2),
                                                yraVyresnisX(StudentoVardas2, StudentoVardas3).

/* 2.6. „studentas A yra jaunesnis už aukštesnio kurso studentą B“. */

jaunesnis(StudentasA, StudentasB) :- 
            studentas(StudentasA, KursasA), studentas(StudentasB, KursasB), KursasA < KursasB,
            yraVyresnisX(StudentasB, StudentasA).



/*
?- jaunesnis(lukas, birute).  -> false 
?- jaunesnis(lukas, migle).   -> false 
?- jaunesnis(jonas, jokubas). -> true

*/


/*__________________________________________________________________________________________________________________*/
/* 5.1. daugyba */


daugyba(0, _, 0).
daugyba(Dauginys, Daugiklis, Sandauga) :-
                                        Dauginys > 0,
                                        NaujasDauginys is Dauginys - 1,
                                        daugyba(NaujasDauginys, Daugiklis, NaujaSandauga),
                                        Sandauga is Daugiklis + NaujaSandauga.

daugyba(Dauginys, Daugiklis, Sandauga) :-
                                        Dauginys < 0,
                                        NaujasDauginys is Dauginys + 1,
                                        daugyba(NaujasDauginys, Daugiklis, NaujaSandauga),
                                        Sandauga is NaujaSandauga - Daugiklis.

/*
?- daugyba(6,6,Sandauga).
Sandauga = 36 

?- daugyba(0,6,Sandauga).
Sandauga = 0

?- daugyba(6,4,S).
S = 24 .

?- daugyba(-6,4,S).
S = -24 .

?- daugyba(6,-4,S).
S = -24 .

?- daugyba(-6,-4,S).
S = 24 .

*/

/* Ingrida Milaševaitė, 3 kursas, 1 grupė */
/* Užduoties variantai: 3; 21; 34; 35 */

/* asmuo(Vardas, Lytis, Amžius, Pomėgis); */

asmuo(arthur, vyras, 62, kvidisas).
asmuo(molly, moteris, 60, burtai).

asmuo(bill, vyras, 40, burtai).
asmuo(fleur, moteris, 40, piesimas).
asmuo(victoire, moteris, 21, burtai).
asmuo(dominique, moteris, 22, muzika).
asmuo(louis, vyras, 20, maistas).

asmuo(george, vyras, 38, sachmatai).
asmuo(angelina, moteris, 37, muzika).
asmuo(fred, vyras, 16, megsta-limonada).
asmuo(roxanne, moteris, 20, kvidisas).

asmuo(ron, vyras, 35, maistas).
asmuo(hermione, moteris, 35, knygos).
asmuo(hugo, vyras, 15, megsta-limonada).
asmuo(rose, moteris, 16, sachmatai).

asmuo(audrey, moteris, 36, tenisas).
asmuo(percy, vyras, 37, masinos).
asmuo(lucy, moteris, 17, futbolas).
asmuo(mally, moteris, 15, knygos).

asmuo(ginny, moteris, 32, burtai).
asmuo(harry, vyras, 35, kvidisas).
asmuo(james, vyras, 14, megsta-limonada).
asmuo(lily, moteris, 13, kvidisas).
asmuo(albus, vyras, 12, megsta-limonada).

/* mama(Mama, Vaikas); */

mama(molly, bill).
mama(molly, george).
mama(molly, percy).
mama(molly, ron).
mama(molly, ginny).

mama(fleur, victoire).
mama(fleur, dominique).
mama(fleur, louis).

mama(audrey, lucy).
mama(audrey, mally).

mama(angelina, fred).
mama(angelina, roxanne).

mama(hermione, hugo).
mama(hermione, rose).

mama(ginny, james).
mama(ginny, lily).
mama(ginny, albus).

/* pora(Vyras, Žmona). */

pora(arthur, molly).
pora(bill, fleur).
pora(george, angelina).
pora(ron, hermione).
pora(harry, ginny).
pora(percy, audrey).

/* __________________________________________________________________________________________________________________ */

/* 3. dukra(Dukra, TevasMama) - Pirmasis asmuo (Dukra) yra antrojo (TevasMama) dukra;*/

dukra(Dukra, Mama) :- mama(Mama, Dukra), asmuo(Dukra, moteris, _, _).
dukra(Dukra, Tevas) :- pora(Tevas, Mama), dukra(Dukra, Mama).

/*
?- dukra(albus,ginny).          - false. (albus yra ginny sunus)
?- dukra(albus,harry).          - false. (albus yra harry sunus)
?- dukra(victoire, molly).      - false. (victoire yra fleur ir bill dukra)
̀?- dukra(ginny,molly).          - true.
?- dukra(Dukra, TevasMama).                             - visos dukros ir ju tevai
Dukra = ginny, TevasMama = molly ; TevasMama = arthur ;
Dukra = victoire,TevasMama = fleur ; TevasMama = bill ;
Dukra = dominique,TevasMama = fleur ; TevasMama = bill ;
Dukra = lucy, TevasMama = audrey ; TevasMama = percy ;
Dukra = mally, TevasMama = audrey; TevasMama = percy ;
Dukra = roxanne, TevasMama = angelina ;TevasMama = george ;
Dukra = rose, TevasMama = hermione ;TevasMama = ron ;
Dukra = lily, TevasMama = ginny ;TevasMama = harry ;
*/

/* __________________________________________________________________________________________________________________ */

/* 21. sesuras(Sesuras, Marti) - Pirmasis asmuo (Sesuras) yra antrojo (Marti) šešuras (vyro tėvas);*/

sesuras(Sesuras, Marti) :- pora(Vyras, Marti), mama(VyroMama, Vyras), pora(Sesuras, VyroMama).

/*
Užklausų pvz.:

?- sesuras(arthur, fleur).         - true.
?- sesuras(arthur, harry).         - false.
?- sesuras(Sesuras, Marti).        - visi Sesurai ir ju Marcios

Sesuras = arthur, Marti = fleur ;
Sesuras = arthur, Marti = angelina ;
Sesuras = arthur, Marti = hermione ;
Sesuras = arthur, Marti = audrey.
*/

/* __________________________________________________________________________________________________________________ */

/*34. paveldejo(Asmuo, Pomegis) - Asmuo (Asmuo) turi tokį patį pomėgį (Pomegis) kaip ir vienas iš tėvų;*/

paveldejo(Asmuo, Pomegis) :- 
    mama(Mama, Asmuo), 
    pora(Tevas, Mama), asmuo(Asmuo, _, _, Pomegis), 
    (asmuo(Tevas, _, _, Pomegis); asmuo(Mama, _, _, Pomegis)).

/*
Užklausų pvz.:

?- paveldejo(bill, burtai).         - true. (bill paveldejo is tevo arthur burtus)
?- paveldejo(bill, kvidisas).       - false. (bill nepaveldejo kvidiso)
?- paveldejo(Asmuo,Pomegis).        - visi vaikai, kurie paveldejo pomegi is tevu ir pomegio pavadinimas
Asmuo = bill, Pomegis = burtai ;
Asmuo = ginny, Pomegis = burtai ;
Asmuo = victoire, Pomegis = burtai ;
Asmuo = lily, Pomegis = kvidisas ;
*/

/* __________________________________________________________________________________________________________________ */

/* 35. tmbml(Berniukas1, Berniukas2, Berniukas3) - */
/* „Trys maži berniukai - Berniukas1, Berniukas2 ir Berniukas3 - mėgsta limonadą“ (kas yra „maži“, nuspręskite patys);*/

/* 8-16m berniukai megsta-limonada*/

tmbml(Berniukas1, Berniukas2, Berniukas3) :- 
    asmuo(Berniukas1, vyras, Amzius1, megsta-limonada), 
    asmuo(Berniukas2, vyras, Amzius2, megsta-limonada), 
    asmuo(Berniukas3, vyras, Amzius3, megsta-limonada), 
    Amzius1 >= 8, Amzius2 >= 8, Amzius3 >= 8,
    Amzius1 =< 16, Amzius2 =< 16, Amzius3 =< 16, Berniukas1\=Berniukas2, Berniukas1\=Berniukas3, Berniukas2\=Berniukas3.

/* 
Užklausų pvz.:
?- tmbml(hugo,james,fred).                      - true (visi 3 berniukai, 8-16m ir megsta limonada)
?- tmbml(hugo,james,albus).                     - true (visi 3 berniukai, 8-16m ir megsta limonada)
?- tmbml(hugo,fred,albus).                      - true (visi 3 berniukai, 8-16m ir megsta limonada)
̀?- tmbml(hugo,fred,lily).                       - false (lily yra mergaite)
?- tmbml(Berniukas1, Berniukas2, Berniukas3).   - visos berniuku (8-16m, kurie megsta limonada) kombinacijos po 3

Berniukas1 = fred, Berniukas2 = hugo, Berniukas3 = james ;
Berniukas1 = fred, Berniukas2 = hugo, Berniukas3 = albus ;
...

*/

/* Programm zur Modellierung einfacher Regeln */
/* Wissensdatenbank */
male(bernd).
male(klaus).
male(simon).
male(david).
male(hugo).
female(gabriele).
female(anna).
female(susi).
female(karin).
female(klara).
/* likes(X, Y) - X mag Y  */
likes(gabriele, cats).
likes(anna, dogs).
likes(hugo, mate).
likes(susi, cats).
likes(simon, dogs).
likes(hugo, anna).
/* parent(X, Y) - X ist Elternteil von Y  */
parent(anna, bernd).
parent(klaus, gabriele).
parent(klaus, hugo).
parent(klaus, susi).
parent(simon, david).
parent(simon, klara).
parent(karin, david).
parent(karin, hugo).
parent(karin, klara).
parent(hugo, bernd).

/* zu implementierende Regeln */
/* X ist die Mutter von Y */
mother(X, Y) :-
	female(X),
	parent(X, Y).

/* X ist der Vater von Y */
father(X, Y) :-
	male(X),
	parent(X, Y).

/* X und Y haben ein Kind */
parents(X, Y) :-
	parent(X, Z),
	parent(Y, Z).

/* X ist ein Grosselternteil von Y */
grandparents(X, Y) :-
	parent(X, Z),
	parent(Z, Y).

/* X ist Geschwister von Y */
sibling(X, Y) :-
	mother(W, X),
	mother(W, Y),
	father(Z, X),
	father(Z, Y),
	X \= Y.

/* Hilfsregel Halbgeschwister vaeterlicherseits  */
halfSibling_f(X, Y) :-
	father(Z, X),
	father(Z, Y),
	X \= Y.

/* Hilfsregel Halbgeschwister muetterlicherseits */
halfSibling_m(X, Y) :-
	mother(Z, X),
	mother(Z, Y),
	X \= Y.

/* X ist Halbgeschwister von Y */
halfSibling(X, Y) :-
	halfSibling_f(X, Y);
	halfSibling_m(X, Y).

/* Hilfsregel Onkel1 */
uncle1(X, Y) :-
	father(Z, Y),
	sibling(Z, X),
	male(X).

/* Hilfsregel Onkel2 */
uncle2(X, Y) :-
	mother(Z, Y),
	sibling(Z, X),
	male(X).

/* X ist der Onkel von Y */
uncle(X, Y) :-
	uncle1(X, Y);
	uncle2(X, Y).

/* Hilfsregel Tante1 */
aunt1(X, Y) :-
	father(Z, Y),
	sibling(Z, X),
	female(X).

/* Hilfsregel Tante2 */
aunt2(X, Y) :-
	mother(Z, Y),
	sibling(Z, X),
	female(X).

/* X ist die Tante von Y */
aunt(X, Y) :-
	aunt1(X, Y);
	aunt2(X, Y).

/* X mag jeden, der das selbe wie es mag, aber nicht sich selbst */
like(X, Y) :-
	likes(X, Z),
	likes(Y, Z),
	X \= Y.

/* David mag alle ohne Kinder */
like(david, Y) :-
	not(parent(Y, X)).


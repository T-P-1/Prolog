/* Programm zur Faerbbarkeit von Karten */

farbe(rot).
farbe(blau).
farbe(gelb).
farbe(gruen).

nachbar(Farbe1,Farbe2) :- Farbe1 \= Farbe2.

map(A,B,C,D,E,F) :-
	farbe(A),
	farbe(B),
	farbe(C),
	farbe(D),
	farbe(E),
	farbe(F),
	nachbar(A,B),
	nachbar(A,D),
	nachbar(B,C),
	nachbar(B,E),
	nachbar(C,E),
	nachbar(C,D),
	nachbar(C,A),
	nachbar(D,E),
	nachbar(E,A),
	nachbar(E,F),
	nachbar(F,A).

loesungen(A,B,C,D,E,F,Liste) :-
	findall([A,B,C,D,E,F], map(A,B,C,D,E,F),Liste).

loesungsCounter(A,B,C,D,E,F,Counter) :-
	loesungen(A,B,C,D,E,F,Liste), length(Liste,Counter).

display :-
	write("Anzahl der moeglichen Loesungen: "),
	loesungsCounter(A,B,C,D,E,F,Counter),
	write(Counter),nl,nl,
	write("Loesungen:"),nl,
	loesungen(A,B,C,D,E,F,Liste),
	write(Liste).
	

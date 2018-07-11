/* Programm zur Ermittlung und Ausgabe des maximalen Elements einer Liste von Ganzzahlen */

list_empty([],true).

maxRecursive([N|Rest], X) :-
	list_empty(Rest, true), X >= N.
maxRecursive([N|Rest], X) :-
	maxRecursive(Rest, X), X >= N.
max(List, X) :-
	member(X, List), maxRecursive(List, X).

memberTest([N|Rest], X) :-
	member(X, [N|Rest]).

/* Test des Programms mit Beispiel-Listen */
display :-
	write("max([1,2,3,6,5],X) ist "),
	max([1,2,3,4,6,5], X),
	write(X),nl,
	write("max([6,5,4,2],X) ist "),
	max([6,5,4,2], Y),
	write(Y),nl,
	write("max([1,8,5,6],X) ist "),
	max([1,8,5,6], Z),
	write(Z),nl,
	write("max([0,8,15],X) ist "),
	max([0,8,15], W),
	write(W).

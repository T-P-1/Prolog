/* Programm zum Sortieren einer Liste von Ganzzahlen mittels MergeSort */

msort([],[]).	/* leere Liste ist bereits sortiert */
msort([X],[X]). /* ein-elementige Liste ist bereits sortiert */

msort(List, Sorted) :-
		divide(List, L1, L2), 	
		msort(L1, Sorted1), msort(L2, Sorted2),	
		merge(Sorted1, Sorted2, Sorted).

/* Teilung der Liste */
divide(L, L1, L2) :- append(L1, L2, L), mylength(L1, C), mylength(L2, C).

mylength([],0).
mylength([_|T],Cneu) :- mylength(T, Calt), Cneu is Calt+1.

merge([], L, L).
merge(L, [], L) :- L \= [].
merge([X|T1], [Y|T2], [X|T]) :- X =< Y, merge(T1, [Y|T2], T).
merge([X|T1], [Y|T2], [Y|T]) :- X > Y, merge([X|T1], T2, T).


display :-
	write("MergeSort der Liste [1,2,2,1], X= "),
       	msort([1,2,2,1],X),
	write(X),nl,
	write("MergeSort der Liste [9,7,5,3], Y= "),
	msort([9,7,5,3],Y),
	write(Y).

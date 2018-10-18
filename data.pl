film(psycho).
film(vertigo).
film(marnie).
film(titanic).
film(inception).
serie(presents).
regie(psycho,hitchcock).
regie(vertigo,hitchcock).
regie(marnie,hitchcock).
regie(titanic,cameron).
regie(inception,nolan).
regie(presents,hitchcock).
bewertung(psycho,8.5).
bewertung(vertigo,8.4).
bewertung(marnie,7.2).
bewertung(titanic,7.7).
bewertung(inception,8.8).
bewertung(presents,8.6).
schauspieler(titanic,di_caprio).
schauspieler(titanic,winslet).
schauspieler(inception,di_caprio).
schauspieler(psycho,perkins).
schauspieler(psycho,leigh).
schauspieler(presents,bronson).

hitchcock(X) :- regie(X,hitchcock).

top(X) :- 
	bewertung(X,Y),
	Y>8.0.
schauspieler_hitchcock(X) :-
	regie(Y,hitchcock),
	schauspieler(Y,X).

zusammenarbeit(X,Y) :-
	schauspieler(A,X),
	schauspieler(A,Y),
	X \= Y.
	

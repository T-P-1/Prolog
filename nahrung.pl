frisst(schlange, maus).
frisst(schlange, hase).
frisst(adler, maus).
frisst(adler, hase).
frisst(maus, ameise).
frisst(hase, gras).
frisst(ameise, gras).
frisst(adler, schlange).

top(X) :-
	frisst(X, Y),
	frisst(X, Z),
	not(frisst(Z, X)),
	not(frisst(Y, X)),
	X \= Y.

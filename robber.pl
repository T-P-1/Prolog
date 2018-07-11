/* Ein Raetsel um einen Bankraub und der Versuch der Aufklaerung desselben */

/* Mr.Jones ist dick und faehrt VW. */
/* Mr.Smith fahert Jaguar und ist Englaender. */
/* der duenne Mann faehrt Fiat. */
/* Mr.Poole ist Schotte. */
/* Mr.Kent traegt blauen Anzug. */
/* Der dicke Mann traegt schwarzen Anzug. */
/* Der duenne Mann ist Ire. */
/* Mr.Bright traegt einen gruenen Anzug und faehrt Renault. */
/* Der kleine Mann ist Schotte. */
/* Der duenne Mann traegt einen blauen Anzug. */
/* Der Mann normaler Statur ist Kanadier. */
/* Der Mann im grauen Anzug faehrt Mazda. */
/* Der Mann im schwarzen Anzug ist Waliser. */
/* Der grosse Mann traegt einen braunen Anzug. */

/* Wissensbasis */
/* Aufbau: [Name,Statur,Nationalitaet,Anzug,Auto] */
robber(X) :- X = [_,_,_,_,_],
	member([jones,dick,_,_,vw],X), 
	member([smith,_,englaender,_,jaguar],X), 
	member([_,duenn,_,_,fiat],X), 
	member([poole,_,schotte,_,_],X), 	
	member([kent,_,_,blau,_],X),
	member([_,dick,_,schwarz,_],X),
	member([_,duenn,ire,_,_],X),
	member([brigth,_,_,gruen,renault],X), 
	member([_,klein,schotte,_,_],X), 
	member([_,duenn,_,blau,_],X), 
	member([_,normal,kanadier,_,_],X), 
	member([_,_,_,grau,mazda],X), 
	member([_,_,waliser,schwarz,_],X), 
	member([_,gross,_,braun,_],X). 

whowasit(Y) :-
	robber(X),		
	/* Letzte Nacht war der Ire mit dem Kanadier zusammen. */
	member([A,_,ire,_,_],X),
	member([B,_,kanadier,_,_],X),
	/* Letzte Nacht war der grosse Mann mit dem Mazda-Fahrer zusammen. */
	member([C,gross,_,_,_],X),
	member([D,_,_,_,mazda],X),
	/* und der gesuchte */
	member([Y,_,_,_,_],X),
	A \= B, C \= D, not(member(Y,[A,B,C,D])).

display :- 
	write("Der gesuchte Raeuber ist: Mr."),
	whowasit(Raeuber),
	write(Raeuber).



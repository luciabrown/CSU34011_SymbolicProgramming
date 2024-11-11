numeral(0).  
numeral(s(X)) :- numeral(X).

lt(0,s(X)). 
lt(s(X),s(Y)):-lt(X,Y). 

ltL(0,[]). 
ltL(s(X), [X|L]) :-ltL(X, L). 

int(X) :- numeral(X).
int(-s(X)) :- numeral(X).

ll(-s(X),0).
ll(-s(X),-s(Y)) :- ll(X,Y); lt(X,Y).
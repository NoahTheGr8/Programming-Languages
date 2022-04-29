/*
Checks if an element is in a list
*/

member2(X, [X|T]).
member2(X, [H|T]) :- member2(X,T).

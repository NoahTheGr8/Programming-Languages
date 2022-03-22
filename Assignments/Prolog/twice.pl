twice([],[]).
twice([H,T], [H,H,A]) :- twice(A,T).

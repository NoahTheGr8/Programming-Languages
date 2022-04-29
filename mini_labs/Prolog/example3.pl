/*
Checks if all members in a list are unique
True if no repitions and false if not
*/

all_diff([]).
all_diff([H|T]) :- not member(H,T), all_diff(T).

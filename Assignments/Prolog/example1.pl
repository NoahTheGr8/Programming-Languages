/*
Checks if list 1 and list 2 yield combined >>> append2(List1, List2, Combined)
*/

append2([], List2, List2).
append2([H|T], List2, [H|Result]) :- append2(T, List2, Result)

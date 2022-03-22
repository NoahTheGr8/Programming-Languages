/*
This prolog function interleaves two lists values' into a new list

interleave([a,b],[1,2],X)
*/

interleave([],L,L).
interleave([X1|L1],[Z1|L2],[X1,Z1|L3]) :- interleave(L1,L2,L3).

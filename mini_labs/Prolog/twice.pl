/*
Twice - can do:
  1) take in a list and output it with duplicates >> twice([1,2],X) -> X=[1,1,2,2]
  2) take in a duplicated list and output it without duplicates >> twice(X,[1,1,2,2]) -> X=[1,2]

  Used concat to help with this
                                  list_concat([],L,L).
                                  list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3). 
*/
twice([],[]).
twice([H|L1],[H,H|L2]) :- twice(L1,L2).

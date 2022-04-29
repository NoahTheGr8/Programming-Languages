/*
Checks if X is the second element in a  list

second(x, [x,y,z]) -> true
second(x, [x,t,z]) -> false
*/

second(X, [Y | [X, Z]]).

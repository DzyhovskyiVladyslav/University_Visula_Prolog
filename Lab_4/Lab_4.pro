DOMAINS
list = integer*
PREDICATES
nondeterm split(integer, list, list, list)
CLAUSES
split(_,[],[],[]).
split(K,[X|L1],[X|L2],L3):-X<=K,!,split(K,L1,L2,L3),
	write(X," <= ",K," ",L1," ",L2," ",L3,"\n").
split(K,[X|L1],L2,[X|L3]):-split(K,L1,L2,L3),
	write(X," > ",K," ",L1," ",L2," ",L3,"\n").
GOAL
split(4,[1,2,4,6,9],L2,L3).
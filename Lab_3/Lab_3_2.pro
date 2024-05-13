PREDICATES
nondeterm sum(integer, integer)
nondeterm table()
CLAUSES
sum(0,0).
sum(N,S):-N1=N-1, sum(N1,S1), S=S1+N*N.
table:-write("------------------"),nl,
	write(" 1 | 2 | 3 |"),nl,
	sum(1,R1),sum(2,R2),sum(3,R3),
	write(R1," | ",R2," | ",R3," | "),nl,
	write("------------------"),fail.
GOAL
table.
DOMAINS
name=symbol
age=integer
gender=symbol
PREDICATES
nondeterm person(name, age, gender)
nondeterm table()
CLAUSES
person("Ivan", 24, "man").
person("Anna", 18, "woman").
person("Bogdan", 10, "man").
person("Emilly", 30, "woman").
person("Ivan", 30, "man").
person("Lera", 54, "woman").
person("Dima", 43, "man").
person("Maru", 70, "woman").
table:-write("----------------------------------"),nl,write(" N | A | G | "),nl,fail.
table:-person(N,A,G),N="Ivan",write(N," | ", A, " | ", G, " | "),nl,fail.
table:-write("----------------------------------"),nl,fail.
GOAL
table.

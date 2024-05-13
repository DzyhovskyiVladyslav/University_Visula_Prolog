DOMAINS
numb_s = integer
stri = symbol
planet = symbol
list_sign = numb_s*
DATABASE
yes(numb_s)
no(numb_s)
PREDICATES
nondeterm sign(numb_s, stri)
nondeterm rule(planet, list_sign)
nondeterm ask (numb_s, stri)
nondeterm remember (numb_s, char)
nondeterm check (list_sign)
run
status_db
clear_facts
print_positive
print_negative
CLAUSES
sign(1, "Type Earthlike").
sign(2, "Type Giant").
sign(3, "Weight > 20^24kg").
sign(4, "Weight < 20^24kg").
sign(5, "Density > 4g/cm^3").
sign(6, "2g/cm^3 < Density < 4g/cm^3").
sign(7, "Density < 2g/cm^3").
sign(8, "Fit for life").
sign(9, "Satellites").
sign(10, "Rings").

rule("Earth", [1, 4, 5, 8, 9]).
rule("Mercury", [1, 4, 5]).
rule("Saturn", [2, 3, 7, 9, 10]).
rule("Uranus", [2, 3, 6, 9]).

run:- rule(Planet, List),
check(List), !,
write("Planet is ", Planet), nl,
status_db,
clear_facts.
run:- write("\nThis Planet not found\n"), nl,
status_db,
clear_facts.

check([]). 
check([Head| Rest]):-
yes(Head), !,
check(Rest). 
check([Head| _]):-
no(Head), !, 
fail. 
check([Head| Rest]):-
sign(Head, Text),
ask(Head, Text),
check(Rest).

ask(Head, Text):-
write("Question: ",Text, "? yes/no"), nl, 
readln(Reply),
frontchar(Reply, First, _), 
remember(Head, First).

remember(Head, 'y'):- assertz(yes(Head)).
remember(Head, 'n'):- assertz(no(Head)), fail.

clear_facts:-
write("\n\nTo exit, press any key\n"),
retractall( _ ),
readchar( _ ).

status_db:- !,
write(""),
print_positive,
print_negative,
write("Finish").

print_positive:-
write("Positive answers"), nl,
write("---------------------"), nl, fail.
print_positive:-
yes(Head), sign(Head, Text),
write(Text, " "),nl,
fail.
print_positive:-
write("--------------"), nl.

print_negative:-
write("Negative answers"), nl,
write("---------------------"), nl, fail.
print_negative:-
no(Head), sign(Head, Text),
write(Text, " "),nl,
fail.
print_negative:-
write("--------------"), nl.
GOAL
run. 
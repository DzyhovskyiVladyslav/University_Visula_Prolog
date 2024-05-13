DOMAINS
firstName=symbol
secondName=symbol
birthYear=integer
gender=symbol
PREDICATES
nondeterm man(firstName, secondName, birthYear, gender)
nondeterm woman(firstName, secondName, birthYear, gender)
nondeterm relative(firstName, firstName)
nondeterm spouses(firstName, firstName)
nondeterm father (symbol, symbol)
nondeterm son (symbol, symbol)
nondeterm cousin (symbol, symbol)
CLAUSES
man("Fred", "Jeff", 1960, "m").
man("Mark", "Jeff", 1985, "m").
man("Andrew", "Audley", 1995, "m").
man("Steven", "Jeff", 2012, "m").
man("Bob", "Jeff", 2013, "m").
man("Charlie", "Audley", 2017, "m").
woman("Maria", "Audley", 1965, "w").
woman("Alina", "Jeff", 1987, "w").
woman("Sofia", "Audley", 1990, "w").
woman("Eve", "Jeff", 2010, "w").
woman("Lisa", "Jeff", 2015, "w").
woman("Charlotte", "Audley", 2019, "w").
relative("Fred","Alina").
relative("Fred","Mark").
relative("Maria","Sofia").
relative("Maria","Andrew").
relative("Alina","Steven").
relative("Alina","Eve").
relative("Mark","Lisa").
relative("Mark","Bob").
relative("Sofia","Lisa").
relative("Sofia","Bob").
relative("Andrew","Charlie").
relative("Andrew","Charlotte").
spouses("Mark", "Sofia").
father(X,Y):-relative(X,Y),man(X,_,_,_).
son(X,Y):-relative(Y,X),man(X,_,_,_).
cousin(K,C):-woman(K,_,_,_),relative(Z,K),relative(Y,C),relative(X,Y),relative(X,Z),K<>C,Y<>Z.
GOAL
%Write("father(\"Mark\",\"Bob\")"),nl,father("Mark","Bob").
%Write("father(\"Sofia\",\"Lisa\")"),nl,father("Sofia","Lisa").
%Write("father(\"Bob\",\"Mark\")"),nl,father("Bob", "Mark").
%Write("father(\"Who\",\"Charlie\")"),nl,father(Who,"Charlie").

%Write("son(\"Mark\",\"Fred\")"),nl,son("Mark", "Fred").
%Write("son(\"Sofia\",\"Maria\")"),nl,son("Sofia", "Maria").
%Write("son(\"Charlie\",\"Andrew\")"),nl,son("Charlie", "Andrew").
%Write("son(\"Who\",\"Aline\")"),nl,son(Who, "Alina").

%Write("cousin(\"Lisa\",\"Steven\")"),nl,cousin("Lisa", "Steven").
%Write("cousin(\"Charlotte\",\"Steven\")"),nl,cousin("Charlotte", "Steven").
%Write("cousin(\"Charlie\",\"Lisa\")"),nl,cousin("Charlie", "Lisa").
%Write("cousin(\"Who\",\"Bob\")"),nl,cousin(Who, "Bob").

%Write("son(Who, \"Mark\"),cousin(\"Eve\", Who)"),nl,son(Who, "Mark"),cousin("Eve", Who).

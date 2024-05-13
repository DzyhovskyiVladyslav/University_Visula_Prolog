DOMAINS
Object=symbol
Prop=weight(symbol);chemical_composition(symbol)
list_of_properties=prop*
name=name(Object)
isa=isa(Object)
PREDICATES
nondeterm frame(name,isa,list_of_properties,list_of_properties)
nondeterm get(Prop, Object)
nondeterm member(prop,list_of_properties)
CLAUSES
member(X,[X|_]).
member(X,[_|T]):-member(X,T).
frame(name("Planet"), isa("null"), [weight("10^25kg")], []).
frame(name("Earthlike"), isa("Planet"), [chemical_composition("Complex chemical compounds")], []).
frame(name("Earth"), isa("Earthlike"), [], [weight("5.9^24kg")]).
frame(name("Mercury"), isa("Earthlike"), [], [weight("3.2^23kg")]).
frame(name("Giant"), isa("Planet"), [chemical_composition("Hydrogen, Helium")], []).
frame(name("Cold"), isa("Giant"), [], []).
frame(name("Hot"), isa("Giant"), [], []).
frame(name("Uranus"), isa("Cold"), [], [weight("8.6^25kg")]).
frame(name("Jupiter"), isa("Hot"), [], [weight("1.8^27kg")]).
get(Prop,Object):-frame(name(Object),_,List_of_properties,_),member(Prop,List_of_properties).
get(Prop,Object):-frame(name(Object),_,_,List_of_properties),member(Prop,List_of_properties).
get(Prop,Object):-frame(name(Object),isa(Parent),_,_),get(Prop,Parent).
GOAL
get(weight("1.8^27kg"),Obj).
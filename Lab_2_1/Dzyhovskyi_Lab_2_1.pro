DOMAINS
object=symbol
parent=symbol
property=symbol
value=symbol
PREDICATES
nondeterm isa(object, parent)
nondeterm hasprop(object, property, value)
nondeterm hasproperty(symbol, symbol, symbol)
CLAUSES
isa("Earth","Earthlike").
isa("Mercury", "Earthlike").
isa("Earthlike","Planet").
isa("Uranus","Cold").
isa("Jupiter","Hot").
isa("Cold","Giant").
isa("Hot","Giant").
isa("Giant","Planet").
hasprop("Planet","Weight","10^25kg").
hasprop("Earthlike","Chemical composition","Complex chemical compounds").
hasprop("Giant","Chemical composition","Hydrogen, Helium").
hasprop("Earth","Weight","5.9^24kg").
hasprop("Mercury","Weight","3.2^23kg").
hasprop("Uranus","Weight","8.6^25kg").
hasprop("Jupiter","Weight","1.8^27kg").
hasproperty(Object, Property, Value):-hasprop(Object, Property, Value).
hasproperty(Object, Property, Value):-isa(Object,Parent),hasproperty(Parent, Property, Value).
GOAL
hasproperty("Uranus","Chemical composition","Complex chemical compounds").

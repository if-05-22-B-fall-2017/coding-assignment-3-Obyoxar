head([Head | _], Head).
tail([_ | Tail], Tail).

isMember([Element | _], Element).
isMember([ _ | Tail], Element) :- isMember(Tail, Element).

concatenate([], T, T).
concatenate([Head | Tail], L, [Head | NewTail]) :- concatenate(Tail, L, NewTail).

prepend([], Element, [Element]).
prepend([Head|Tail], Element, [Element| NewTail]) :- prepend(Tail, Head, NewTail).

% native code "append" cannot be redefined
cappend([], Element, [Element]).
cappend([Head|Tail], Element, [Head|NewTail]) :- cappend(Tail, Element, NewTail).

% length also exists
clength_int([],0).
clength_int([_|T], Len+1) :- clength_int(T, Len).
clength(List, Len) :- clength_int(List, X), Len is X.

remove([Head|Tail], Head, Tail).
remove([Head|Tail], Element, [Head|NewTail]) :- remove(Tail, Element, NewTail).
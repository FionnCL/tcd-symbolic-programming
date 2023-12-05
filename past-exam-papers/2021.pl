% Q1
% (a) (i)
% This is a list. Its members are 0, followed by X.

% (a) (ii)
% This is a list, similarly to (a)(i), which members are 0, followed by Y.

% (b)
membe(_,[],0).
membe(Item, [HL|HT], NewCount):-
    Item=HL,
    membe(Item, HT, Count),
    NewCount is Count + 1.
membe(Item, [HL|HT], Count):-
    dif(Item,HL),
    membe(Item, HT, Count).

% (c) (i)
% This is true.
sublist(SubL,L):- append(_,S,L), append(SubL,_,S).
sublis2(SubL,L):- append(S,_,L), append(_,SubL,S).
% True as the constraints stay the same, just moved around. The result of unification between S and L stays the same.

% (c) (ii)
% This is true.
sublis3(SubL,L):- append(SubL,_,S), append(_,S,L).
% sublis3/2 closely resembles sublist/2, just with the order of inner-predicates swapped.
% it will still unify as the Prolog interpreter is smart.

% (c) (iii)
% Incomplete
sub(SubL,L):- 
    append(_,S,L), 
    append(SubL,_,S),
    dif(L,[]).

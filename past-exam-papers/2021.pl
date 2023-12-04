% Q1
% (a) (i)
% This is a list. Its members are 0, followed by X.

% (a) (ii)
% This is a list, similarly to (a)(i), which members are 0, followed by Y.

% (b)
% Incomplete: Does not work for queries like membe(X, [a,b,a,a,b,c,c], 2).
membe(_,[],0).
membe(Item, [HL|HT], NewCount):-
    Item=HL,
    membe(Item, HT, Count),
    NewCount is Count + 1.
membe(Item, [HL|HT], Count):-
    dif(Item,HL),
    membe(Item, HT, Count).

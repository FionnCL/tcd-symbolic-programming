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
sub(SubL,L):- 
    append(_,S,L),
    append(SubL,_,S),
    S\=[], SubL\=[]. % DOES NOT WORK AS INTENDED, GETS RID OF ALL []s

% (d)
% Honestly, I am not sure.
% My first intinct is to say ____, as the findall/3 must pattern match with L, which must be of length N.
% Given a length N, findall is going to find all combinations of said list of length N.
% findall/3 will look for all X such that q(X). This will find all X's that are q(X).
% q(X) has a finite amount of solutions. Assuming there is an answer to the query, the number of solutions to the 
% query IS the instantiation of N that answers the query.

% Q2
% (a) (i)
int(0).
int(NewX):- int(X), NewX is X + 1.
    
% (a) (ii)
% I cannot get this to alternate negative-positive-negative-positive ///-------------------------------
intgr(0).
intgr(NewX):- intgr(X), (X > 0, NewX is X + 1; X < 0, NewX is -X + 1).

% (b) (i)
good([0]).
good([1,0]).
good([A,B|T]) :- good([B|T]), (B > 0, A is -B ; B < 0, A is -B + 1).

% (b) (ii)
% Yeah I have no clue ///------------------------------------------------------------------------------
s --> [0].
s --> [1,0].
s --> [Y], [X], s, {X>0, Y is -X}.
s --> [Y], [X], s, {X<0, Y is -X+1}.


% Q3
% % (a)
% This is very slightly wrong in terms of the abstract query:
% It will set A=C instead of A=B. 
diff(X,[],X).
diff([H|T],L, [H|C]):-
    not(member(H, L)),
    diff(T,L,C).

diff([H|T], [LH|LT], C):-
    member(H, [LH|LT]),
    diff(T,LT,C).
    
% (b)
% INCOMPLETE ///---------------------------------------------------------------------------------------
s1([]) --> [].
s1([H|T]) --> repeat(H, _), s1(T).

repeat(_, 0) --> [].
repeat(H, NewCnt) --> [H], repeat(H, Cnt), {NewCnt is Cnt + 1}.

repeat(_, 0) --> [].
repeat(H, NewCnt) --> [H], repeat(H, Cnt), {NewCnt is Cnt + 1}.

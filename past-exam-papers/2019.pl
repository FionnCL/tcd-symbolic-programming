% >>>---------- QUESTION 1 ----------<<<
% Q1 (a)(i) - 5 MARKS
% I am unsure about this.
reading(you, this).
time(carefully(read(you, this)), now).
question(looking(you, 'your neighbour\'s paper')).

% Q1 (a)(ii) - 5 MARKS
% Prolog promotes declarative programming because the language works by making inferences
% based off of past statements i.e. declarations. You do not calculate, you pattern match.

% Q1(a)(iii) - 5 MARKS
% Disclaimer: Completely bullshitting here:
% Unification is used declaratively by making statements, and pattern matching with variables.
% Unification is used imperatively by combining the use of statements and rules to pattern match.
% Unification is used interrogatively by _______{no idea}.

% Q1 (b) - 20 MARKS
% X=X*1						>>>		X=X*1
% X is X*1					>>>		Arguments not instantiated
% X is 2+3					>>>		X=5
% [[]] = [[]|[]]			>>>		true
% [[],[]] = [[]|[]] 		>>>		false
% findall(X,X\=X,L)			>>>		L=[]
% setof(X,X\=X,L)			>>>		false
% .([],.(a,A))=[A,a]		>>>		sandbox rescriction(prob need DB)
% (X=1+X,!,Y=Z); Z=1, Z<2 	>>>		X = 1+X, Y = Z
% ((assert(party),!,retract(party)); X=1),X=2	>>> X=2

% Q1 (c) - 5 MARKS
member(X,[X|_]).
member(Item, [_|T]):-
    member(Item,T).

% Q1 (d) - 10 MARKS
% TODO: DRAW A SEARCH TREE \\\---------------<<<

% >>>---------- QUESTION 2 ----------<<<
% Q2 (a) - 5 MARKS
numeral(0).
numeral(s(X)):- numeral(X).

less(0,s(_)).
less(s(X),s(Y)):-
    less(X,Y).

% Q2 (b) - 10 MARKS
decrList([_]).
decrList([H1,H2|T]):-
    less(H2,H1),
    decrList([H2|T]).

% Q2 (c) - 10 MARKS
subset(_,[]).
subset(X,[X|T]):-
    decrList([X|T]).

% Q2 (d) - 10 MARKS
% NOTE: INCORRECT ANSWER
% What I have here returns true if X is between [Item1, Item2](inclusive).
interval(X,[I1,I2]):-
    subset(X,[I1,I2]).

% Q2 (e) - 5 MARKS
neg(0,0).
neg(s(X),p(Y)):-
    neg(X,Y).

% Q2 (f) - 10 MARKS
% This is a really good question to understand some fundamentals.
pOm(X) :- %pOm(X) such that:
    X=0; 	% {X can be zero OR}
    numeral(Y), % {if Y is a numeral:
    (Y=X; neg(Y,X)), % X=Y OR Y=-X
    dif(X,0).		% where X is not zero}

% >>>---------- QUESTION 3 ----------<<<
% Q3 (a) - 20 MARKS
% This answer does not cover cases where n+m is MORE THAN k.
add(0,X,X).
add(s(X),Y,s(Z)):-
    add(X,Y,Z).

%s --> as(AC), bs(BC), cs(CC), {numeral(AC), numeral(BC), numeral(CC), add(AC,BC,CC)}.
as(0) --> [].
as(s(C)) --> [a], as(C).
bs(0) --> [].
bs(s(C)) --> [b], as(C).
cs(0) --> [].
cs(s(C)) --> [c], as(C).

% Q3 (b) - 5 MARKS
% Difference lists are simple a list containing the difference between the elements of two other lists.
% They can be useful as they act kind of like an accumulator, but saving each step.
% They can allow you to construct lists that are based off some rules to do many things to other lists 
% such as filter them, check that the list follows a correct order, etc. The latter allows us to form
% grammars.

% Q3 (c) - 5 MARKS
% I did not do (a) well so here is a generic DCG:
% I dunno if this is correct tbh I just wrote it.
%s([X|T],[H|TY]):-
%    a(X,Z),
%    b(Z,H),
%    s(T, TY).

% Q3 (d) - 15 MARKS
s([], _) --> [].
s(_,0) --> [].
s([H|T], N) --> {(X=0;X<N*2), Leftover is N - X}, element(H, X), s(T, Leftover).

element(_,0) --> [].
element(E, NewC) --> [E], element(E, C), {NewC is C + 1}.

% IMPORTANT NOTE:
% THIS EXAM WAS TAKE HOME, HENCE THE LONG "SHORT" QUESTIONS.
% ---------------------------------------------
% Q1
% (a) (i)
'Pat is happy every day it is sunny'.
% Query1 = Just type in the above into the interpreter as well!

% (a) (ii)
happyPat(sunnyDay).
% Query2 = happyPat(When).

% (a) (iii)
sunnyDay(pat, happy).
% Query3 = sunnyDay(Who, What).

% (a) (iv)
sunnyDay(today).
happy(pat, X) :- sunnyDay(X).
% Query4 = happy(Who, When).

% (a) (v)
day(sunny).
pat(happy) :- day(sunny).
% Query5 = pat(What).

% (b)
% INCOMPLETE <-----------------------------------///
subl(Sub,List) :- 
    append(_,Suffix,List),
    append(Sub,_,Suffix).

% (c)
nonRep([]).
nonRep([H|T]):-
    nonRepeating(H,T),
    nonRep(T).

nonRepeating(_,[]).
nonRepeating(Element, [H|T]):-
    Element\=H,
    nonRepeating(Element, T).

% (d)
% It is not included in the answer as findall/3 attempts to find all X such that
% It can find the subset of X in the list of [1]. 
% The list [1] only contains one element: 1, so you would think this would be the answer but:
% subset/2, as seen in the question, will return true for subset([],[1]), which means that
% it will return [] as the subset of [1], it will then pattern match this with the X in findall/3,
% resulting in the answer being [[]]!

% (e) (i)
numeral(0).
numeral(succ(X)) :- numeral(X).
% When you run "X = succ(X), numeral(X)." you get a runtime error,
% more accurately it won't stop running, 
% soooooo idk, that is probably the answer.

% (e) (ii)
% For this question, it only worked with tail recursion.
% Always use tail recursion, kids.
nu(0).
nu(succ(X)) :- X\=succ(X), nu(X).

% (e) (iii)
% INCOMPLETE <---------------------------------------///
nume(succ(0)).
nume(succ(X)) :- nume(X).

% (f)
% This answer could easily be done another way, but this answer took me a minute to do,
% and is the answer I would give in an exam.
% NOTE: for the last query of str(Na,Nb,Nc,L), the predicate gets stuck using a list of a's:
% [a,a,a,....infinity]. I do believe the answer is right it just values a's first.
% Other answer using conditionals could be the answer.
str(0,0,0,[]).
str(succ(Na),Nb,Nc, [H|T]):-
    H=a,
    str(Na, Nb, Nc, T).
str(Na,succ(Nb),Nc, [H|T]):-
    H=b,
    str(Na, Nb, Nc, T).
str(Na,Nb,succ(Nc), [H|T]):-
    H=c,
    str(Na, Nb, Nc, T).

% Q2
% (a)
% Probably wrong:
s(X,Y):-
    X=[0],
    t(X,Y).

t(_,[]).
t(X,Y):-
    s(X,Z),
    Z=[1],
    t(Z,Y).

% (b)
fib --> fib(0, 1).
fib(A, B) --> [A, B].
fib(A, B) --> [A], next(B, A).
next(B, C) --> {A is C + B}, fib(B, A).

% (c) (i)
% TODO:
s(Acc) --> [1], rest(Acc).
rest(Acc) --> [0], rest(AccOut), {Acc > 0, AccOut is Acc - 1}.
rest(Acc) --> [1], rest(AccOut), {Acc > 0, AccOut is Acc - 1}.

% (c) (ii)
% TODO

% Q3
% (a)
% I am stopping here because lecture 11 memoisation is mentioned here.
% I will not be studying lecture 11 or 12.

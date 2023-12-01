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
% INCOMPLETE <-----------------------------------
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

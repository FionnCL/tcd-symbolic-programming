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
% pat(What).

% (b)
% INCOMPLETE
sublist(Sub,List) :- 
    append(_,Suffix,List),
    append(sub,_,Suffix).

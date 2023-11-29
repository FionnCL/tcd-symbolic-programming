% Q1
% (a)
% (i)
'Pat is happy every day it is sunny'.
% Query1 = Just type in the above into the interpreter as well!

% (ii)
happyPat(sunnyDay).
% Query2 = happyPat(When).

% (iii)
sunnyDay(pat, happy).
% Query3 = sunnyDay(Who, What).

% (iv)
sunnyDay(today).
happy(pat, X) :- sunnyDay(X).
% Query4 = happy(Who, When).

% (v)
day(sunny).
pat(happy) :- day(sunny).
% pat(What).

% (b)
sublist(Sub,List) :- 
    append(_,Suffix,List),
    append(sub,_,Suffix).

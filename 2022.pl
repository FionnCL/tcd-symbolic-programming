% Q1
% (a)(i)
% IDK what this means
% (a)(ii)
magic(wizards).

% (a)(iii)
% The prolog interpreter will attempt to pattern 
% match for X in magic(X). As our rule states
% magic(magic), it will find X=magic
% and X=wizards, if we follow from the last question.
magic(magic).

% (b)
% UNSURE:
% It is not a list.

% (c)
% UNSURE:
% It is not a list

% (d)
% Divide down to either 0 or 1. 
% Take take this remainder and append.
% Half the initial value (floor).
% Repeat.
n2bs(0,[]). % End when remainder is 0
n2bs(X, S):-
    divide(X, R, S1), 	% Divide X by 2, return floor remainder
    append(S2, S1, S), 	% Pattern match recursive output
    n2bs(R, S2).		% Tail recurse

divide(0, 0, [0]). 			% Base case return 0
divide(succ(0), 0, [1]). 	% Base case return 1.
divide(succ(succ(X)), succ(R), S):- % Divide X by 2, return R(floor(X/2)), S will be the remainder.
    divide(X,R,S).			% Tail recurse
% Q1
% (a)(i)
magic(X):- wizard(X).

% (a)(ii)
wizard(yennefer).

% (a)(iii)
% Note: The examiner may not want this.
magic(magic):- !.
magic(X):- magic(X).

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

% Question 2
% (a)(i)
member(X,[X|_]).
member(X,[_|T]):-
    member(X,T).

% (a)(ii)
% First off, this will return a syntax error.
% It is missing a closing bracket.
% If it did work, due to the cut the answer is:
% L=[1]
% This is because it returns one, sees the cut, and realises it doesn't need
% to return anything else.

% (a)(iii)
% Once again, syntax error.
% If it worked:
% L=[1,2]
% This happens because it will:
% Check for memb(1, [1|_). This is true, but doesn't invoke a cut.
% Check for memb(2, [2|_). This is false so check:
%	memb(2,[_|Y]):- memb(2,Y), !. This returns true but invokes the cut. 
% Program Finished.

% (b)
% changed name from s to s2 due to it being used
% as a name already.
s2 --> [1,2,2].
s2 --> q0, s2.
q0 --> [1], q1.
q1 --> [1], q2.
q1 --> [2,2], q2.
q2 --> [2,2].

% (c)
s3(X) --> parse(X).
parse(k(a(_,_))) --> [].
parse(k(a(X,_))) --> [X].
parse(k(a(X,Y))) --> [X], parse(Y).
parse(k(a(_,Y))) --> parse(Y).
parse(a(X,_)) --> [X].
parse(a(_,Y)) --> parse(Y).
parse(c(X,Y)) --> [X], [Y].

% (d)
% tbh to do this shit you need to have 
% got (c) completely right. I did not.
% I got the test cases to work because
% I do not understand the notation.

% Question 3(Prob not full marks)
% (a)
s --> [].
s --> {add(AC, CC, BC)}, a(AC), b(BC), c(CC).

add(0,X,X).
add(succ(X),Y,succ(Z)):-
    add(X,Y,Z).

a(0) --> [].
a(succ(X)) --> [a], a(X).

b(0) --> [].
b(succ(X)) --> [b], b(X).

c(0) --> [].
c(succ(X)) --> [c], c(X).

% (b) (Works, Just swapped
% around the order of recursive terms
% so that they come after a call
% to a different node).
q0 --> [a], q1.
q0 --> [a], q0.
q1 --> [b], q2.
q1 --> [b], q1.
q2 --> [].

% (c)
p(a).
% ?- setof(a,p(a),[a]).
% TRUE: This is due to the way
% setof/3 works. It will look for
% any x that is defined by predicate
% p/1, and return it to the list.
% If p(a) exists, then this will
% return true. The above predicate
% will make this true. If p(t) is not
% true, then there is no possible
% declaration of t to put into the set.

% (d)(i)
append([], L, L).
append([H|L1], L2, [H|L3]):-
 append(L1, L2, L3).

% (d)(ii)
% Prolog will concatenate lists
% A and B together in the form of
% [A + B], and the result is stored
% in C. As these are undefined, the 
% answers shall be:
% A=[],
% B=C
% 
% A=[UNDEFINED],
% C=[UNDEFINED|B]
% 
% A=[UNDEFINED,UNDEFINED],
% C=[UNDEFINED,UNDEFINED|B]
% In the exam it may make sense that
% they do not want a second/third answer.

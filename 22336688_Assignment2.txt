% PROBLEM 1

% Main predicate, odd/3
odd(L, A, B) :- odd_sequence(L, A, B).

% Base case for odd-length sequence
odd_sequence(L, [X|Tail], Tail) :-member(X, L).

% Recursive case for odd-length sequence
odd_sequence(L, [X|A], B) :-member(X, L),even_sequence(L, A, B).

% Base case for even-length sequence (empty list)
even_sequence(_, A, A).

% Recursive case for even-length sequence
even_sequence(L, [X, Y | A], B) :-member(X, L),member(Y, L),even_sequence(L, A, B).


% PROBLEM 2

s --> [].              
s --> a, s.            
a --> [0].             
a --> [1].             

% Predicate p(L) to enumerate all bit strings in increasing order of length
p([]).                 % Length 0: the empty list
p([_|T]) :- p(T).      % Recursively add length size to the tail


% PROBLEM 3

% Start fib at 0,1
fib --> [0, 1], fib_sequence(0, 1).

% Base case: stop generating terms
fib_sequence(_, _) --> [].

% Recursive case: generate next Fibonacci term, continue
fib_sequence(Fn, Fn1) --> 
    { Fn2 is Fn + Fn1 },       % Calculate the next Fibonacci number
    [Fn2],                     % Add Fn2 to the list
    fib_sequence(Fn1, Fn2).    % Continue with the next pair (Fn1, Fn2)





% PROBLEM 4

% Given in the question predicates
accept(L) :- steps(q0,L,F), final(F).
steps(Q,[],Q).
steps(Q,[H|T],Q2) :- tran(Q,H,Qn), steps(Qn,T,Q2).

numeral(0).
numeral(succ(X)) :- numeral(X).

% Tran : Non-accepting states
% q0 initial state
tran(q0, 0, q0).  % Loop on 0 in q0, no 1's yet 
tran(q0, 1, q1).  % Move to q1 on seeing 1

% q1
tran(q1, 0, q2).  % Move to q2 on 0, two positions from end, third-to-last could be 1
tran(q1, 1, q2).  % Move to q2 on 1, two positions from end, third-to-last could be 1

% q2 
tran(q2, 0, q3).  % Move to q3 on seeing 0 (suffix 100 or 110)
tran(q2, 1, q3).  % Move to q3 on seeing 1 (suffix 101 or 111)

% Loop in q3
tran(q3, 0, q3).
tran(q3, 1, q3).

% Final : Accepting state
final(q3).  % Only q3 is an accepting state, when third-to-last bit is `1`

% Turn transitions into a DCG
% Initial state
q0 --> [0], q0.  % Loop on 0
q0 --> [1], q1.  % Transition to q1 on seeing 1

% State q1
q1 --> [0], q2.  % Move to q2 with 0 as the second-to-last bit
q1 --> [1], q2.  % Move to q2 with 1 as the second-to-last bit

% State q2
q2 --> [0], q3.  % Transition to q3 with suffix 100 or 110
q2 --> [1], q3.  % Transition to q3 with suffix 101 or 111

% Accepting state
q3 --> [0], q3.  % Remain in q3 with `0`
q3 --> [1], q3.  % Remain in q3 with `1`
q3 --> [].       % Accept the string as it is

% String Numeral predicate

% Define the main predicate l3(String, Numeral)
l3(String, Numeral) :- 
    numeral(Numeral),                % valid numeral
    numeral_length(Numeral, Length), % get length
    length(String, Length),           % Check string has that length
    q0(String, []).                    % Check if String belongs to L3 using the DCG

% Helper predicate to convert numeral to length
% Base case: numeral 0 corresponds to length 0
numeral_length(0, 0).                          

% Get length of predecessor and increment
numeral_length(succ(X), L) :-numeral_length(X, L1),L is L1 + 1.                             
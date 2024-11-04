% PROBLEM 4

% Accept 
accept(L) :- steps(q0,L,F), final(F).
steps(Q,[],Q).
steps(Q,[H|T],Q2) :- tran(Q,H,Qn), steps(Qn,T,Q2).

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

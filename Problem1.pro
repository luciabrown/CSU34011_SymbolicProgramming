% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 1 - Incr
% Base Cases
incr(f0(null), f1(null)).          % 0 + 1 = 1
incr(f1(null), f0(f1(null))).      % 1 + 1 = 10

% Increment Recursion
incr(f0(X), f1(X)) :- pterm(X).     %If X is a pterm, increment with no carry: 10 + 1 = 11

incr(f1(X), f0(Y)) :- incr(X, Y).  %Carry case: change 1's to 0's&  make the next 0 a 1: 11 + 1 = 100
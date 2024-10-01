% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 2 - Legal

% Base Cases
legal(null).      % Null is legal
legal(f1(null)).  % Binary 1 is legal
legal(f0(null)).  % Binary 0 is legal

% Recursive Cases
legal(f1(X)) :- legal(X), X \= f0(null).    % Legal if f0(null) does not occurr at the end
legal(f0(X)) :- legal(X).                   % Everything following 0 is legal




% Problem 2 - incrR - Checks if all parts of the incr are legal
% Base Cases
incrR(f0(null), f1(null)) :- legal(f0(null)), legal(f1(null)).               % 0 + 1 = 1 if 0 is legal & 1 is legal
incrR(f1(null), f0(f1(null))) :- legal(f1(null)), legal(f0(f1(null))).      % 1 + 1 = 10 if 1 is legal & 10 is legal

% Increment Recursion
incrR(f0(X), f1(X)) :- legal(X), legal(f0(X)), legal(f1(X)).     % If X is legal, increment with no carry: 10 + 1 = 11

incrR(f1(X), f0(Y)) :- incrR(X, Y), legal(f1(X)), legal(f0(Y)).  % Carry case: change 1's to 0's & make the next 0 a 1: 11 + 1 = 100

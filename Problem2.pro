% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

%Problem 2 - Legal

% Base Cases
legal(null).
legal(f1(null)).

% Recursive Cases
legal(f1(X)) :- legal(X).
legal(f0(X)) :- false.
legal(f1(f0(null))) :- false.
legal(f0(X)) :- legal(X), X == null.


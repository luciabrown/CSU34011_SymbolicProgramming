% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 3 - Add
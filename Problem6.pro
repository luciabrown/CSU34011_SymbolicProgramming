% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 6 - Normalise

% Base Cases
normalize(null, f0(null)).
normalize(f0(null), f0(null)).
normalize(f1(null),f1(null)).

% Recursive Cases

% Normalize f1
normalize(f1(X), f1(X_norm)) :-
    normalize(X, X_norm).



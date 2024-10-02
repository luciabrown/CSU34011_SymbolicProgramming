% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 6 - Normalise

% Base Cases
legal(null).      % Null is legal
legal(f1(null)).  % Binary 1 is legal
legal(f0(null)).  % Binary 0 is legal

% Recursive Cases
legal(f1(X)) :- legal(X), X \= f0(null).    % Legal if f0(null) does not occurr at the end
legal(f0(X)) :- legal(X).                   % Everything following 0 is legal
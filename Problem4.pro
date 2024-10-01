% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 4 - Mult

% Base Cases
mult(null, P2, null).          % null * P2 = null
mult(P1, null, null).          % P1 * null = null    
mult(f0(null), P2, f0(null)).  % 0 * P2 = 0
mult(P1, f0(null), f0(null)).  % P1 * 0 = 0
mult(f1(null), P2, P2).        % 1 * P2 = P2
mult(P1, f1(null), P1).        % P2 * 1 = P2
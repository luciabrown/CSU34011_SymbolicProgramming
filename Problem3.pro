% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 3 - Add

% Base Cases
add(null, null, null) :- false.         % null + null = null/false
add(f0(null), f0(null), f0(null)).      % 0 + 0 = 0
add(f0(null), f1(null), f1(null)).      % 0 + 1 = 1
add(f1(null), f0(null), f1(null)).      % 1 + 0 = 1
add(f1(null), f1(null), f0(f1(null))).  % 1 + 1 = 10

% Recursive Cases


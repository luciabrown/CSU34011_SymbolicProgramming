% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Base Cases
incr(f0(null), f1(null)).          % 0 + 1 = 1
incr(f1(null), f0(f1(null))).      % 1 + 1 = 10
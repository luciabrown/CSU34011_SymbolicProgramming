% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 3 - Add

% Base Cases
add(null, P2, P2).  % null + P2 = P2
add(P1, null, P1).  % P1 + null = P1    
add(f0(null), P2, P2).  % 0 + P2 = P2
add(P1, f0(null), P1).  % P1 + 0 = P1

% Recursive Cases

% Even + Odd
add(f0(X), f1(Y), Z) :-                             
    add(X, Y, Intermediate), Z = f1(Intermediate).    % X + Y = intermediate

% Odd + Even
add(f1(X), f0(Y), Z) :-                             
    add(X, Y, Intermediate), Z = f1(Intermediate).    % X + Y = intermediate

% Odd + Odd
add(f1(X), f1(Y), Z) :-                               
    add(X, Y, Intermediate),                           % X + Y = intermediate
    add(f1(null), Intermediate, Result),              % 1 + intermediate must be even
    Z = f0(Result).                                   % Z must be even

% Even + Even
add(f0(X), f0(Y), f0(Z)) :-                            % No carry for even
    add(X, Y, Z).    % X + Y = Z
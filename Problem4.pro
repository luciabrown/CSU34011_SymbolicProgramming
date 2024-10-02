% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 4 - Mult
% https://youtu.be/xHWKYFhhtJQ?si=q35NtGDfyG3dBNj- 

% Base Cases
add(null, P2, P2).  % null + P2 = P2
add(P1, null, P1).  % P1 + null = P1    
add(f0(null), P2, P2).  % 0 + P2 = P2
add(P1, f0(null), P1).  % P1 + 0 = P1

% Even + Odd ADD
add(f0(X), f1(Y), Z) :-                             
    add(X, Y, Intermediate), Z = f1(Intermediate).    % X + Y = intermediate

% Odd + Even ADD
add(f1(X), f0(Y), Z) :-                             
    add(X, Y, Intermediate), Z = f1(Intermediate).    % X + Y = intermediate

% Odd + Odd ADD
add(f1(X), f1(Y), Z) :-                               
    add(X, Y, Intermediate),                           % X + Y = intermediate
    add(f1(null), Intermediate, Result),              % 1 + intermediate must be even
    Z = f0(Result).                                   % Z must be even


mult(null, P2, null).          % null * P2 = null
mult(P1, null, null).          % P1 * null = null    
mult(f0(null), P2, f0(null)).  % 0 * P2 = 0
mult(P1, f0(null), f0(null)).  % P1 * 0 = 0
mult(f1(null), P2, P2).        % 1 * P2 = P2
mult(P1, f1(null), P1).        % P2 * 1 = P2

% Recursive Multiplication Cases
mult(P1, f0(X), Result) :-     % P1 * 0
    mult(P1, X, Intermediate),   % Recurse with X
    add(Intermediate, Intermediate, Result). % P1 * 0 = 0 (added twice)
    
mult(P1, f1(X), Result) :-     % P1 * (X + 1)
    mult(P1, X, Intermediate),    % Recurse with X
    add(Intermediate, P1, Result). % P1 * (X + 1) = P1 * X + P1



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

% Even + Even ADD
add(f0(X), f0(Y), f0(Z)) :-                            % No carry for even
    add(X, Y, Z).    % X + Y = Z


mult(null, P2, null).          % null * P2 = null
mult(P1, null, null).          % P1 * null = null    
mult(f0(null), P2, f0(null)).  % 0 * P2 = 0
mult(P1, f0(null), f0(null)).  % P1 * 0 = 0
mult(f1(null), P2, P2).        % 1 * P2 = P2
mult(P1, f1(null), P1).        % P2 * 1 = P2

% Recursive Multiplication by an Even Number
mult(f0(X), P2, f0(Z)) :- mult(X, P2, Z).                % Even number multiplication, add 0 to result

% Recursive Multiplication by an Odd Number
mult(f1(X), P2, Z) :-
    mult(X, P2, ShiftedResult),                          % Shift bits, same as even mult
    add(P2, f0(ShiftedResult), Z).                       % Add P2 back to result


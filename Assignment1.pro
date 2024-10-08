% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 1 - Incr
% Base Cases
incr(f0(null), f1(null)).          % 0 + 1 = 1
incr(f1(null), f0(f1(null))).      % 1 + 1 = 10

% Increment Recursion
incr(f0(X), f1(X)) :- pterm(X).     %If X is a pterm, increment with no carry: 10 + 1 = 11

incr(f1(X), f0(Y)) :- incr(X, Y), pterm(X), pterm(Y).  %Carry case: change 1's to 0's&  make the next 0 a 1: 11 + 1 = 100



% Problem 2 - Legal

% Base Cases
legal(null).      % Null is legal
legal(f1(null)).  % Binary 1 is legal
legal(f0(null)).  % Binary 0 is legal

% Recursive Cases
legal(f1(X)) :- legal(X), X \= f0(null).    % Legal if f0(null) does not occurr at the end
legal(f0(X)) :- legal(X).                   % Everything following 0 is legal

% Problem 2 - incrR - Checks if all parts of the incr are legal
% Base Cases
incrR(f0(null), f1(null)) :- legal(f0(null)), legal(f1(null)).               % 0 + 1 = 1 if 0 is legal & 1 is legal
incrR(f1(null), f0(f1(null))) :- legal(f1(null)), legal(f0(f1(null))).      % 1 + 1 = 10 if 1 is legal & 10 is legal

% Increment Recursion
incrR(f0(X), f1(X)) :- legal(X), legal(f0(X)), legal(f1(X)).     % If X is legal, increment with no carry: 10 + 1 = 11

incrR(f1(X), f0(Y)) :- incrR(X, Y), legal(f1(X)), legal(f0(Y)).  % Carry case: change 1's to 0's & make the next 0 a 1: 11 + 1 = 100




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
    




% Problem 4 - Mult
% https://youtu.be/xHWKYFhhtJQ?si=q35NtGDfyG3dBNj- 

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



% Problem 5 - Reverse

% Base Case
revers(null, null).                             % Reverse of null is null
revers(f1(null), f1(null)).                     % Reverse of 1 is 1
revers(f0(null),f0(null)).                      % Reverse of 0 is 0

revers(f0(X),RevP) :-                           % Find 0
    revers(X, RevX),                            % Recursively reverse
    append(f0(null), RevX, RevP).               % Append 0 to end

 revers(f1(X),RevP) :-                          % Find 1
    revers(X, RevX),                            % Recursively reverse
    append(f1(null), RevX, RevP).               % Append 1 to end


append(Pterm, null, Pterm).                     % If null, result is null

append(Pterm, f0(X), f0(NewX)) :- append(Pterm, X, NewX).   % Recurse terms until last zero, append to pterm        

append(Pterm, f1(X), f1(NewX)) :- append(Pterm, X, NewX).   % Recurse terms until last one, append to pterm



% Problem 6 - Normalise

% Base Cases
normalize(null, f0(null)).
normalize(f0(null), f0(null)).
normalize(f1(null),f1(null)).

normalize(P, Pn) :-
    revers(P, Rev),                         % Reverse the input term
    remove_leading_zeros(Rev, NoZeros),     % Remove leading zeros from reversed term
    revers(NoZeros, Pn).                    % Reverse it back to get normalized term = legal

% Helper predicate to remove leading zeros
remove_leading_zeros(f0(null), f0(null)).       % Only f0(null) remains
remove_leading_zeros(f1(X), f1(X)).             % Leading 1  not removed
remove_leading_zeros(f0(X), Result) :-          % If leading zero, recurse
    remove_leading_zeros(X, Result).            % Continue removing leading zeros


% TEST CASES

% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).
% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).
% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).
% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).
% make a pterm T from a number N numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).
% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.
% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).
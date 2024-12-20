% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

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
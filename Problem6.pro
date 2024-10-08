% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).


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


% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 5 - Reverse

% Make a list of the pterms
make_list(null, []).                                    %Empty list to start
make_list(f0(X),[0|list]) :- make_list(X, list).        %Add 0 to list head, call recursion
make_list(f1(X), [1|list]) :- make_list(X, list).       %Add 1 to list head, call recursion

% Make a list back into pterms to print
make_pterm([], null).                                   %null pterm to start  
make_pterm([0|list], f0(X)) :- make_pterm(list,X).      %Make 0 a pterm, call recursion
make_pterm([1|list], f1(X)) :- make_pterm(list,X).      %Make 1 a pterm, call recursion

%Reverse a list


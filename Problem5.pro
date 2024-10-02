% Facts
pterm(null).
pterm(f0(X)) :- pterm(X).
pterm(f1(X)) :- pterm(X).

% Problem 5 - Reverse
% Source of help: https://www.educba.com/prolog-reverse-list/ 
% Source of help: https://stackoverflow.com/questions/23264828/prolog-working-with-capital-letter 

% Make a list of the pterms
make_list(null, []).                                    %Empty list to start
make_list(f0(X),[0|Tail]) :- make_list(X, Tail).        %Add 0 to list head, call recursion
make_list(f1(X), [1|Tail]) :- make_list(X, Tail).       %Add 1 to list head, call recursion

% Make a list back into pterms to print
make_pterm([], null).                                   %null pterm to start  
make_pterm([0|Tail], f0(X)) :- make_pterm(Tail,X).      %Make 0 a pterm, call recursion
make_pterm([1|Tail], f1(X)) :- make_pterm(Tail,X).      %Make 1 a pterm, call recursion

% Reverse a list
reverseList(List, revList) :-
    rev_list_helper(List, [], revList).

rev_list_helper([], Temp, Temp).                         
rev_list_helper([H|T], Temp, revList):-
	rev_list_helper(T, [H|Temp], revList).              % Add head to temp list 


% Main
revers(P, revP) :-
    make_list(P, List),                                 % Make pterms a list
    reverseList(List, revList),                         % Call reverser
    make_pterm(revList, revP).                          % Convert list back to pterms


% PROBLEM 1

% Main predicate, odd/3
odd(L, A, B) :- odd_sequence(L, A, B).

% Base case for odd-length sequence
odd_sequence(L, [X|Tail], Tail) :-member(X, L).

% Recursive case for odd-length sequence
odd_sequence(L, [X|A], B) :-member(X, L),even_sequence(L, A, B).

% Base case for even-length sequence (empty list)
even_sequence(_, A, A).

% Recursive case for even-length sequence
even_sequence(L, [X, Y | A], B) :-member(X, L),member(Y, L),even_sequence(L, A, B).
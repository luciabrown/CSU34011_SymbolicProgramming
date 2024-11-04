% PROBLEM 2

s --> [].              
s --> a, s.            
a --> [0].             
a --> [1].             

% Predicate p(L) to enumerate all bit strings in increasing order of length
p([]).                 % Length 0: the empty list
p([_|T]) :- p(T).      % Recursively add length size to the tail

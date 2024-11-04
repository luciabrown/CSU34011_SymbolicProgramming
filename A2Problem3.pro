% PROBLEM 3

% Start fib at 0,1
fib --> [0, 1], fib_sequence(0, 1).

% Base case: stop generating terms
fib_sequence(_, _) --> [].

% Recursive case: generate next Fibonacci term, continue
fib_sequence(Fn, Fn1) --> 
    { Fn2 is Fn + Fn1 },       % Calculate the next Fibonacci number
    [Fn2],                     % Add Fn2 to the list
    fib_sequence(Fn1, Fn2).    % Continue with the next pair (Fn1, Fn2)
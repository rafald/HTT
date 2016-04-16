# How should one explain recursion?  It’s simple.  If you want to refer to yourself, you need to give yourself a name.  
# “I” will do, but so will any other name, by the miracle of α-conversion.  
# A computation is given a name using a fixed point (not fixpoint, dammit) operator:  
#     fix x is e stands for the expression e named x for use within e.  
# Using it, the textbook example of the factorial function is written thus:

fix f is fun n : nat in case n {zero => 1 | succ(n') => n * f n'}

# Let us call this whole expression fact, for convenience.  If we wish to evaluate it, 
# perhaps because we wish to apply it to an argument, its value is

fact = fix f is fun n : nat in case n {zero => 1 | succ(n') => n * f n'}
fun n : nat in case n {zero => 1 | succ(n') => n * fact n'}.


# It is only necessary to make sure that the named computation does indeed name itself.  
# This can be achieved by a number of means, including circular data structures (non-well-founded abstract syntax), 
# but the most elegant method is by self-application.  
# Simply arrange that a self-referential computation has an implicit argument with which it refers to itself.  
# Any use of the computation unrolls the self-reference, ensuring that the invariant is maintained.  
# No storage allocation is required.
# Consequently, a self-referential functions such as

fix f is fun (n : nat, m:nat) in case n {zero => m | succ(n') => f (n',n*m)}

# execute without needing any asymptotically significant space.  It is quite literally a loop, 
# and no special arrangement is required to make sure that this is the case.  
# All that is required is to implement recursion properly (as self-reference), and you’re done.  
# There is no such thing as tail-call optimization.  It’s not a matter of optimization, but of proper implementation.  
# Calling it an optimization suggests it is optional, or unnecessary, or provided only as a favor, 
# when it is more accurately described as a matter of getting it right.





fixPoint f x = let x' = f x in if x == x' then x else fixPoint f x'

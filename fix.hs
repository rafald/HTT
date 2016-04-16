fixPoint f x = let x' = f x in if x == x' then x else fixPoint f x'

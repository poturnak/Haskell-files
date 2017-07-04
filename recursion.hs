{-
Recursion is when you define the function that applies itself within the definition. Meaning you call function from inside that function.

Edge condition is when you define the function for several input values non recursively. 

Recursion is important to Haskell because unlike imperative languages, you do computations in Haskell by declaring what something is instead of declaring how you get it.

For recursion to stop you always have to think about the edge condition.

-}

-- here we implement the maximum function that analyzes the list and extracts maximun out of it
maxim ys = case ys of [] -> error "Empty list is passed"
                      (x:[]) -> x
                      (x:xs) -> if x > maxim xs
                                   then x
                                   else maxim xs

maxim1 ([]) = error "Empty list passed"
maxim1 (x:[]) = x
maxim1 (x:xs) = max x (maxim xs)

maxim2 ys
    | [] <- ys      = error "Empty list passed"
    | (y:[]) <- ys  = y
    | (y:ys) <- ys  = max y (maxim ys)


-- here we will implement replicate function

replica 0 b = [] -- this one is fine but we are not including the negative numbers
replica a b = [b] ++ replica (a - 1) b

replica1 xs ys
    | xs <= 0 = []
    | otherwise = ys : replica1 (xs-1) ys

-- next we will implement take (takes certain number of elements from the list)

take1 xs ys
    | xs <= 0 = []
    | ([]) <- ys = []
    | (a:as) <- ys = a : take1 (xs-1) as

-- next we will try to implement the reverse function

rever x
    | ([]) <- x = []
    | (x:xs) <-x = rever xs ++ [x]

-- now we will implement repeat

repeat' x = x:repeat' x

-- now we will implement zip

zip' x y
    | ([]) <- x = []
    | ([]) <- y = []
zip' (x:xs) (y:ys) = [(x, y)] ++ zip' xs ys

-- now we will implement elem


elem' _ [] = False
elem' x (y:ys) = (x == y) || elem x ys

-- let's now implement quicksort

quicksort :: (Ord a) => [a] -> [a]
quicksort ([]) = []
quicksort (x:xs) =
    let small = quicksort [a | a <- xs, a <= x]
        big = quicksort [a | a <- xs, a > x]
    in small ++ [x] ++ big

















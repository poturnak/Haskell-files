{-
Folds are applied to lists and they reduce the list to a single value.

A fold takes:
 - binary function (takes 2 parameters)
 - starting value (this is where you start the accumulator)
 - a list to fold

foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b

What fold is basically doing is taking two adjacent elements and combines them using the binary function that is passed to fold.

    foldl: left fold; folds the list from the left side. acc is the first argument
    foldr: right fold; folds the list from the right side. acc is on the right
    foldl1: same as left fold but does not need the starting value; left most value is taken as first
    foldr1: same as right fold, but does not need the starting value; right one is taken as first
    scanl: same as foldl but reports all intermidiate results in the form of a list
    scanr: same as foldr but reports all intermidiate results in the form of a list

The left fold's binary function has the accumulator as the first parameter and the current value as the second one (so \acc x -> ...), the right fold's binary function has the current value as the first parameter and the accumulator as the second one (so \x acc -> ...)

$ is the helper function. Basically it means open the ( and then close ) at the far end of the expression. 


-}

foldSum = foldl (+) 0 [1,2,3,4,5]

sum' :: Num a => [a] -> a
sum' = foldl (+) 0

-- you can also use lambda functions to pass to fold. Say we want to multiply all elements of the list. It is convenient to call this variable acc, since it is accumulating the results.

multList :: Num a => [a] -> a
multList = foldl (\acc b -> acc * b) 1

-- we can also implement elem using the fold function

elem' :: Eq a => a -> [a] -> Bool
elem' y ys = foldl (\acc b -> if b == y then True else acc ) False ys

-- let's try to count all the elements above certain number using foldl

countNum :: (Foldable t, Ord a1, Num a) => a1 -> t a1 -> a
countNum x ys = foldl (\acc b -> if b >= x then acc + 1 else acc) 0 ys

countNum' :: Ord a => a -> [a] -> Int
countNum' x ys = length (filter (>=x) ys)

-- let's now implement the map function using the foldr

mapFold :: (a -> b) -> [a] -> [b] 
mapFold f xs = foldr (\a acc -> f a : acc) [] xs

head' :: [a] -> a  
head' = foldr1 (\x _ -> x) 

test x = case x of 5 -> "empty"

-- now we are going to take a look at function composition. We do function composition with . function
-- For example, say we want to go through the list and turn each number into the negative number. 

mappingNumbers :: Num a => [a] -> [a]
mappingNumbers = map (\x -> negate (abs x)) -- this is using map

-- we can also do the same thing using the folds

mappingNumbers' :: Num a => [a] -> [a]
mappingNumbers' xs = foldl (\acc a -> acc ++ [negate.abs $ a ]) [] xs

mappingNumbers'' :: Num a => [a] -> [a]
mappingNumbers'' = map (negate . abs)

{-

Notes about function composition:
 - you create f(g(x)) by doing f.g
 - to pass the parameter into this function you need (f.g) x
    or you can use f.g $ x
    or you can put this into other vaeiable y = f.g and then pass variable to y

$ is like parenthesis

Examples:
 - abs.negate $ 5
 - map (negate . abs) [5,-3,-6,7,-3,2,-19,24] 
 - (sum . replicate 5 . max 6.7) 8.9
 - sum . replicate 5 . max 6.7 $ 8.9

-}










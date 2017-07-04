{-
Lambdas are basically anonymous functions that are used because we need some functions only once.

To make a lambda:
    - write a \
    - then we write the parameters, separated by spaces
    - After that comes a ->
    - then the function body

We usually surround them by parentheses, because otherwise they extend all the way to the right.

Lambdas are expressions. 
-}

firstLambda :: [Double]
firstLambda = zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]  

-- you can also pattern match in lambdas

secondLambda = map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]  

flip' :: (a -> b -> c) -> b -> a -> c  
flip' f = \x y -> f y x  






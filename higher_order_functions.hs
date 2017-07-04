{-
Haskell functions can take functions as parameters and return functions as return values. A function that does either of those is called a higher order function.

=====Curried functions=====
All the functions that accept more than one parameter are called curried functions. 

if you call a function with too few parameters, you get partially applied function. This partial application allows us to create functions on the fly and pass functions around. 

Infix functions can also be partially applied by using sections. To section an infix function, simply surround it with parentheses and only supply a parameter on one side. That creates a function that takes one parameter and then applies it to the side that's missing an operand.

divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)  

isUpperAlphanum :: Char -> Bool  
isUpperAlphanum = (`elem` ['A'..'Z']) 

As you can see, a single higher order function can be used in very versatile ways. Imperative programming usually uses stuff like for loops, while loops, setting something to a variable, checking its state, etc. to achieve some behavior and then wrap it around an interface, like a function. Functional programming uses higher order functions to abstract away common patterns, like examining two lists in pairs and doing something with those pairs or getting a set of solutions and eliminating the ones you don't need.
-}

takesNumber x = x

addsNumber a b = a b + b

-- now we are going to implement zipWith. It takes a function and two lists as parameters and then joins the two lists by applying the function between corresponding elements.

testFunc a b = a + b

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' x y z
    | ([]) <- y = []
    | ([]) <- z = []
zipWith' x (y:ys) (z:zs) = [x y z] ++ zipWith' x ys zs

-- now let's implement flip. Flip simply takes a function and returns a function that is like our original function, only the first two arguments are flipped

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = 
    let g x y = f y x
    in g

flip'' :: (a -> b -> c) -> (b -> a -> c)
flip'' f = g
    where g x y = f y x

flip''' :: (a -> b -> c) -> b -> a -> c
flip''' f x y = f y x

-- map takes a function and a list and applies that function to every element in the list, producing a new list.

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

-- now we will take a look at filter

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (y:ys) = if f y == True
                   then y : filter' f ys
                   else filter' f ys

-- Let's find the largest number under 100,000 that's divisible by 3829

largest = maximum [ x | x <- [1..100000], mod x 3829 == 0]

largest' :: (Integral a) => a  
largest' = head (filter (f) [100000,99999..])  
    where f x = x `mod` 3829 == 0

largest'' = let f x = x `mod` 3829 == 0
            in head (filter (f) [100000,99999..])

-- find the sum of all odd squares that are smaller than 10,000

sumOfSquares' = sum (takeWhile (<10000)(map (^2) (filter odd [1..])))

sumOfSquares = takeWhile (<10000)[ x^2 | x <- [1..], odd (x^2)]

-- we'll be dealing with Collatz sequences. We take a natural number. If that number is even, we divide it by two. If it's odd, we multiply it by 3 and then add 1 to that. We take the resulting number and apply the same thing to it, which produces a new number and so on. In essence, we get a chain of numbers.

chain :: (Eq a, Num a, Integral a) => a -> [a]
chain 1 = [1]
chain a 
    | even a = a : chain (a `div` 2)
    | odd a = a : chain (a * 3 + 1)

-- for all starting numbers between 1 and 100, how many chains have a length greater than 15? The answer is 66. 

counter :: Integral a => [a] -> [a]
counter [] = []
counter (x:xs)
    | length (chain x) > 15 = 1 : counter xs
    | otherwise = 0 : counter xs

counter' :: Int
counter' = length (filter isLong (map chain [1..100]))
    where isLong x = length x > 15












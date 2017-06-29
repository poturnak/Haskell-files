{-
 - to multiply negative number you need to use brackets 5 * (-4)
 - boolean logic
 - && - and
 - || - or
 - == - equlity sign
 - /= inequality sign
 - strings are defined with ""
 - ++ combine two lists together
 - : is used to put an item in front of the list (can not be list)
 - ^ raise to the power of

=====FUNCTIONS=====
Function names can not start with the capital letter
functions can be 'prefix' or 'infix' functions
prefix functions are typed before arguments: min a b 
infix functions are typed in between arguments: 5 + 6 (+ is the function here)
when you call infix functions you have to use '', for example, 92 'div' 9

you call functions without any parenthesis, meaning bar 3 is the function bar and 3 is passed into it

functions are defined using the following framework:
	funcname param1 param2 = operations (returned value)

you can also call your own functions in the functions that you made (the order in which you define those functions does not matter)

In Haskell you need to make basic functions that are correct and then create more complex functions

=====IF STATEMENT=====
In Haskell if is the expression, since it always returns something, because the else part is mandatory


=====LISTS=====
Lists in Haskell are homogenous, meaning lists can store the items of the same type.
In Haskell the string is also a list.
You can also apply >, <, >=, /=, == to the lists to compare them
List can also contain nested lists.
	++ - used to combine two lists together
	: - prepend an item to the list (must be same type)
	!! - get an item from the list using its index

=====RANGES=====
	[1..20] - list from 1 to 20
	[2,4..20] - list of even numbers from 2 to 20
	take 24 [13, 26..] - first 24 multiples of 13

=====LIST COMPREHENSION=====
[x*2 | x <- [1..10]] - take x from 1 to 10 and return the multiples of 2
[x*2 | x <- [1..10], x*2 >= 10] - same as above, but includes the condition
In list comprehensions you can draw from several lists x<-[1..10], y<-[1..15], and in this case you will have all permutations from these 2 lists

Our own version of lenght function:
	length' xs = sum [1 | _ <- xs] 

=====TUPLES=====
Tuples are lists that can store items of different types
Use tuples when you know in advance how many components some piece of data should have.

=====TYPES=====
Haskell has type inference.
Type are written starting from the capital letter.
:: means "has a type of"

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

	Int: bounded integer
	Integer: unbounded integer
	Float: floating point 
	Double: real floating point with double the precision
	Bool: boolean type
	Char: character

[a] -> a - is a type variable, meaning it can be of any type. Functions that have type variables are called polymorphic functions. 

=====TYPECLASSES=====
ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool  

	=> is called type constraint

read: takes the string and then can infer the type of it
	read "5" + 5 - will return 9
	read "5" - will be mistake since Haskell does not know what type to infer

You can do type annotations by adding :: at the exnd of expression:
	read "5" :: Integer

	Eg: used for types that support equality testing; function, it uses == or /= somewhere inside its definition
	Ord: for types that have ordering
	Show: members of show can be presented as strings
	Read: The read function takes a string and returns a type which is a member of Read
	Enum: members are sequentially ordered types — they can be enumerated
	Bounded: members have an upper and a lower bound
	Num: numeric type class (Int, Integer, Float, Double)
	Integral: includes only Int and Integer
	Floating: Float and Double


+++++HOW TO WORK WITH FUNCTIONS+++++

=====PATTERN MATCHING=====
Patterns are a way of making sure a value conforms to some form and deconstructing it

lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!" 

factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

x:xs - will pattern match the list; head will go to x, tail will go to xs
a:b:c:cs - extract three elemts and put the tail into cs

if you use pattern matching, you need to use ()

=====GUARDS=====
Guards are a way of testing whether some property of a value (or several of them) are true or false; very similar to IF statements.

=====WHERE=====

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  

It's a common idiom to make a function and define some helper function in its where clause and then to give those functions helper functions as well, each with its own where clause.

=====LET BINDINGS=====
The form is let <bindings> in <expression>. The names that you define in the let part are accessible to the expression after the in part.

cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

WHERE spans across guards
LET does not span across guards
WHERE is just synctatic construct
LET is the expression (returns value)

=====CASE EXPRESSIONS=====
case expression of pattern -> result  
                   pattern -> result  
                   pattern -> result  
                   ...  

Case expressions can be used anywhere.

-}


doubleMe x = x + x -- takes one number as input

doubleUs x y = doubleMe x + doubleMe y -- takes 2 numbers as input

doubleSmallNumber x = if x > 100 then x else x * 2

listOne = [1, 2, 3, 4, 5]
listTwo = ['a', 'b', 'c', 'd'] -- this will be the same as string "abcd"
listThree = [6, 7, 8, 9]
sumOfLists = listOne ++ listThree
sumOfLists1 = 55 : listOne -- you have to use item of the same type

indexItem = listOne !! 1 -- get the item by the index and indexing starts with 0

elemCheck = elem 6 listOne -- False
elemCheck1 = elem 5 listOne -- True

length' xs = sum [1 | _ <- xs] 

removeUpperCase string = [ x | x <- string, elem x ['A'..'Z']] -- removes everything from the string but leaves only the uppercase letters

-- let's remove all odd numbers from the list using list comprehensions

xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]

removeOdd = [[ b | b <- a, odd b]| a <- xxs]
 
factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

head' :: [a] -> a  
head' [] = error "Can't call head on an empty list, dummy!"  
head' (x:xs) = x 

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

length'' :: (Num b) => [a] -> b  
length'' [] = 0  
length'' (_:xs) = 1 + length'' xs  

sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs  

bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!" 

calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2 






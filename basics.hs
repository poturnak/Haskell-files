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






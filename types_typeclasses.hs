{-

To define your own type you use the data keyword
data Bool = False | True 
    you define the name and the values the type can have, where | means or

data Int = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647 

deriving Show is used to include the class in Show typeclass so that it becomes printable.

-}

data Point = Point Float Float deriving (Show)  
data Shape = Circle Point Float | Rectangle Point Point deriving (Show) 

surface :: Shape -> Float  
surface (Circle _ r) = pi * r ^ 2  
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1) 

nudge :: Shape -> Float -> Float -> Shape  
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r  
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b)) 

multiplyPoint:: Point -> Float
multiplyPoint (Point a b) = a*b

point1 = Point 4 5

-- let's define the data type that defines a person

data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     } deriving (Show)

person1 = Person {firstName="Nikolay", lastName="Poturnak", age=31}
 -- now you can directly use the functions that Haskell defined for us
 -- firstName person1 will return "Nikolay"
 -- etc.









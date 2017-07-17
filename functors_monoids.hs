{-
Functors are things that can be mapped over. 
In Haskell they are described by typeclass Functor.
Functor typeclass has only one method:
    fmap :: (a -> b) -> f a -> f b

If you want to make your type an instance of Functor, your type needs to be of a kind * -> *

IO can also be a functor. 

    instance Functor IO where  
        fmap f action = do  
            result <- action  
            return (f result)

Another instance of Functor that we've been dealing with all along but didn't know was a Functor is (->) r.

    instance Functor ((->) r) where  
        fmap f g = (\x -> f (g x))

Another way to define:
    instance Functor ((->) r) where  
        fmap = (.)

Pretty much when you do fmap func funct
You are doing function composition. 

=====FUNCTOR LAWS=====
The first functor law states that if we map the id function over a functor, the functor that we get back should be the same as the original functor. 

    fmap id functor = functor

The second law says that composing two functions and then mapping the resulting function over a functor should be the same as first mapping one function over the functor and then mapping the other one.

    fmap (f . g) = fmap f . fmap g
    fmap (f . g) F = fmap f (fmap g F)

=====APPLICATIVE FUNCTORS=====
These are beefed up functors represented by Applicative typeclass.

    class (Functor f) => Applicative f where  
        pure :: a -> f a  
        (<*>) :: f (a -> b) -> f a -> f b

<*> takes a functor that has a function in it and another functor and sort of extracts that function from the first functor and then maps it over the second one.

Let's take a look at the applicative instance of Maybe

    instance Applicative Maybe where  
        pure = Just  
        Nothing <*> _ = Nothing  
        (Just f) <*> something = fmap f something

ghci> pure (+) <*> Just 3 <*> Just 5  
Just 8  


Control.Applicative exports a function called <$>, which is just fmap as an infix operator. Here's how it's defined:

    (<$>) :: (Functor f) => (a -> b) -> f a -> f b  
    f <$> x = fmap f x

By using <$>, the applicative style really shines, because now if we want to apply a function f between three applicative functors, we can write f <$> x <*> y <*> z. If the parameters weren't applicative functors but normal values, we'd write f x y z.

Lists are also applicative functors. Here is how the instance is defined:

    instance Applicative [] where  
        pure x = [x]  
        fs <*> xs = [f x | f <- fs, x <- xs]

    ghci> (*) <$> [2,5,10] <*> [8,10,11]  
    [16,20,22,40,50,55,80,100,110]

Another instance of Applicative that we've already encountered is IO. This is how the instance is implemented:

    instance Applicative IO where  
        pure = retu(rn  
        a <*> b = do  
            f <- a  
            x <- b  
            return (f x)

myAction :: IO String  
myAction = (++) <$> getLine <*> getLine  

same as:

myAction :: IO String  
myAction = do  
    a <- getLine  
    b <- getLine  
    return $ a ++ b

Another instance of Applicative is (->) r, so functions.

    instance Applicative ((->) r) where  
        pure x = (\_ -> x)  
        f <*> g = \x -> f x (g x)

=====NEWTYPE KEYWORD=====
NEWTYPE keyword let's us make new types out of existing ones. 

The newtype keyword in Haskell is made exactly for these cases when we want to just take one type and wrap it in something to present it as another type.

Every time you need to make a type of existing one, use newtype. 
When you do that you can only have one value constructor.

In other cases, you need to use the data keyword.

===== TYPE vs NEWTYPE vs DATA =====
The type keyword is for making type synonyms. What that means is that we just give another name to an already existing type so that the type is easier to refer to.

    type IntList = [Int]

With this you do not get value constructor. In your function declarations you can refer to [Int] as IntList.

The newtype keyword is for taking existing types and wrapping them in new types, mostly so that it's easier to make them instances of certain type classes.

    newtype CharList = CharList { getCharList :: [Char] }  

Newtype types can only have 1 value constructor. 

If you just want your type signatures to look cleaner and be more descriptive, you probably want type synonyms. If you want to take an existing type and wrap it in a new type in order to make it an instance of a type class, chances are you're looking for a newtype. And if you want to make something completely new, odds are good that you're looking for the data keyword.

===== MONOIDS =====
By noticing and writing down these properties, 
we have chanced upon monoids! 
A monoid is when you have an associative binary function 
and a value which acts as an identity with respect to 
that function. When something acts as an identity with 
respect to a function, it means that when called with 
that function and some other value, the result is always 
equal to that other value. 
1 is the identity with respect to * and [] is the identity with respect to ++. There are a lot of other monoids to be found in the world of Haskell, which is why the Monoid type class exists. It's for types which can act like monoids.

class Monoid m where  
    mempty :: m  
    mappend :: m -> m -> m  
    mconcat :: [m] -> m  
    mconcat = foldr mappend mempty

The Monoid type class is defined in import Data.Monoid.

That's why when making instances, we have to make sure they follow these laws:

    mempty `mappend` x = x
    x `mappend` mempty = x
    (x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)

The first two state that mempty has to act as the identity with respect to mappend and the third says that mappend has to be associative i.e. that it the order in which we use mappend to reduce several monoid values into one doesn't matter.









-}


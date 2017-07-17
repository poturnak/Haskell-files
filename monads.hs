{-
fmap :: (Functor f) => (a -> b) -> f a -> f b 
(<*>) :: (Applicative f) => f (a -> b) -> f a -> f b
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b  

>>= is pronounced as bind.

Monad typeclass:

    class Monad m where  
        return :: a -> m a  
  
        (>>=) :: m a -> (a -> m b) -> m b  
  
        (>>) :: m a -> m b -> m b  
        x >> y = x >>= \_ -> y  
  
        fail :: String -> m a  
        fail msg = error msg

The first function that the Monad type class defines is return. It's the same as pure, only with a different name. Its type is (Monad m) => a -> m a. It takes a value and puts it in a minimal default context that still holds that value. In other words, it takes something and wraps it in a monad.

The next function is >>=, or bind. It's like function application, only instead of taking a normal value and feeding it to a normal function, it takes a monadic value (that is, a value with a context) and feeds it to a function that takes a normal value but returns a monadic value.

Maybe instance of Monad:
    instance Monad Maybe where  
        return x = Just x  
        Nothing >>= f = Nothing  
        Just x >>= f  = f x  
        fail _ = Nothing

===== do notation =====

foo :: Maybe String  
foo = do  
    x <- Just 3  
    y <- Just "!"  
    Just (show x ++ y) 

It's important to remember that do expressions are just different syntax for chaining monadic values.

In do expression every line is a monadic value. The result always have to be the monadic value.

routine :: Maybe Pole  
routine = do  
    start <- return (0,0)  
    first <- landLeft 2 start  
    Nothing  
    second <- landRight 2 first  
    landLeft 1 second  

When we write a line in do notation without binding the monadic value with <-, it's just like putting >> after the monadic value whose result we want to ignore.

===== LIST MONAD =====

instance Monad [] where  
    return x = [x]  
    xs >>= f = concat (map f xs)  
    fail _ = [] 

Here is how to do filtering with do notation using guard.

sevensOnly :: [Int]  
sevensOnly = do  
    x <- [1..50]  
    guard ('7' `elem` show x)  
    return x

===== MONAD LAWS =====

    return x >>= f is the same damn thing as f x
    m >>= return is no different than just m
    (m >>= f) >>= g is just like doing m >>= (\x -> f x >>= g)

===== Writer Monad =====

Writer monad is for values that have another value attached that acts as a sort of log value. 

Writer allows us to do computations while making sure that all the log values are combined into one log value that then gets attached to the result.

The Control.Monad.Writer module exports the Writer w a type along with its Monad instance and some useful functions for dealing with values of this type.

===== THE STATE MONAD =====
newtype State s a = State { runState :: s -> (a,s) }  

    instance Monad (State s) where  
        return x = State $ \s -> (x,s)  
        (State h) >>= f = State $ \s -> let (a, newState) = h s  
                                            (State g) = f a  
                                        in  g newState

(>>=) :: State s a -> (a -> State s b) -> State s b  



    
    








-}

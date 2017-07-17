{-
That's because in a do block, the last action cannot be bound to a name like the first two were. 

Remember, to get the value out of an I/O action, you have to perform it inside another I/O action by binding it to a name with <-.

I/O actions will only be performed when they are given a name of main or when they're inside a bigger I/O action that we composed with a do block.

So use <- when you want to bind results of I/O actions to names and you can use let bindings to bind pure expressions to names.


    main = do   
        line <- getLine  
        if null line  
            then return ()  
            else do  
                putStrLn $ reverseWords line  
                main  
  
    reverseWords :: String -> String  
    reverseWords = unwords . map reverse . words

in an I/O do block, ifs have to have a form of 'if condition then I/O action else I/O action'.

in Haskell (in I/O actions specifically), return makes an I/O action out of a pure value.

We can use return in combination with <- to bind stuff to names.

    main = do  
        a <- return "hell"  
        b <- return "yeah!"  
        putStrLn $ a ++ " " ++ b


When dealing with I/O do blocks, we mostly use return either because we need to create an I/O action that doesn't do anything or because we don't want the I/O action that's made up from a do block to have the result value of its last action, but we want it to have a different result value, so we use return to make an I/O action that always has our desired result contained and we put it at the end.


-}
  
{-main = do  
    putStrLn "What's your first name?"  
    firstName <- getLine  
    putStrLn "What's your last name?"  
    lastName <- getLine  
    let bigFirstName = map toUpper firstName  
        bigLastName = map toUpper lastName  
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"  -}

import System.Random  
import Control.Monad(when)  
  
{-main = do  
    gen <- getStdGen  
    let (randNumber, _) = randomR (1,10) gen :: (Int, StdGen)     
    putStr "Which number in the range from 1 to 10 am I thinking of? "  
    numberString <- getLine  
    when (not $ null numberString) $ do  
        let number = read numberString  
        if randNumber == number  
            then putStrLn "You are correct!"  
            else putStrLn $ "Sorry, it was " ++ show randNumber  
        newStdGen  
        main  -}

main = do
    let a=5
    newStdGen:


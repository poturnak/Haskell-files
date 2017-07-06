{- 
TO check the modules: https://downloads.haskell.org/~ghc/latest/docs/html/libraries/

Haskell module is a collection of functions, types, and typeclasses.
Haskell program is a collection of modules where main module loads all the other ones. 

The syntax for importing module is:
    import <module name>

To load the module from GHCI you can use :m + <module name>

For selective function import you do the following:
    import <module name> (func1, func2)

If you want to import all but several functions you can:
    import <module name> hiding (func1, func2)

If you have overlapping names from different modules you can:
    import qualified Data.Map as M (then when you call the function from data.map you will use m.filter)



-}

-- let's calculate the number of unique elements in a list

import Data.List

uniqueElements :: Eq a => [a] -> [a]
uniqueElements = foldr (\a acc -> if elem a acc then acc else a:acc) []

uniqueElementsCount :: Eq a => [a] -> Int
uniqueElementsCount = length . uniqueElements

-- to create your own module you use the following:
{-
module Geometry.Cube  
( volume  
, area  
) where  
  
import qualified Geometry.Cuboid as Cuboid  
  
volume :: Float -> Float  
volume side = Cuboid.volume side side side  
  
area :: Float -> Float  
area side = Cuboid.area side side side  
-}
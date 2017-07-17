{-

taoFbobjFull 1303728283

If you create a file in a subdirectory, e.g. Lib/Delta/NetblockUtils.hs, the module name has to be the same name.

import Haxl.SI.Prelude - to import standard HAXL linraries and functions.
:t map m

The input map is where the parameters for a Haxl policy are stored. It is accessed from Haxl code using the lookupInput operation.

To see the content of the input map use :inputs show

taoFbobjFull :: Id -> Haxl FbObj
textAttr :: Text -> Fbobj -> Haxl Text

textAttr takes a Text key and fetches a Text attribute from an Fbobj.

To work with exceptions use withDefault:

    userGray :: Id -> Haxl Bool
    userGray uid =
      withDefault False $ do
        obj <- taoFbobjFull uid
        confirmed <- intAttr "confirmed" obj
        return (confirmed == 40)

withDefault supplies a default value that is used if the Haxl operation in its second argument (the whole do expression in the example above) fails with certain kinds of exception.

 - Transient Errors: these are exceptions that occur because something outside our control is temporarily not working. Perhaps a server is down, or there was a network problem. An example is a TAORequestFailed exception.
 - Logic Errors: these are failures thrown by an API. For example, attempting to fetch an FB object that doesn't exist throws a NotFound exception, which is a logic error. The infrastructure is working correctly and if you repeated the request you would get the same result, so it isn't a transient error. These are used by Haxl operations and not pure code; in pure code we typically manipulate explicit failure values, such as the Maybe type.
 - Critical Errors: these are failures that indicate something went wrong in the framework somewhere. They are fatal, and Haxl code should never try to catch one.

withDefault catches only transient and logic errors, and ignores critical errors.

In Haskell maps and JSON objects are the same. 
When working with JSON import:

    import qualified Data.HashMap.Strict as HashMap



-}

type Syn = [Int]

data Test a = Test {test :: a, move :: Int} deriving Show
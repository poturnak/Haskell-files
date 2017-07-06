{-

succ: takes anything and returns the successor (input 8 will return 9)
min: returns lesser argument (min 4 6)
max: returns bigger argument (max 4 5)
div: take the division without remainder (div 92 10 - returns 9)
show: takes a value and presents it to us in the form of a string
read: is the opposity of show; takes the string as input and identofies the type of itmn
odd: checks if the integral number is odd
zipWith: It takes a function and two lists as parameters and then joins the two lists by applying the function between corresponding elements.
flip: Flip simply takes a function and returns a function that is like our original function, only the first two arguments are flipped
map: takes a function and a list and applies that function to each item in list.
takeWhile: It takes a predicate and a list and then goes from the beginning of the list and returns its elements while the predicate holds true

=====LISTS=====
++ concatenates several lists of the same type
: prepends the item to the list
!! take element from the list by its index
	list !! 1 - returns first element
head: takes a list and returns its head
tail: takes the list, chops off its head the returns the list
last: takes the list and returns the last element
init: takes the list and returns everything except the last element
length: takes a list and returns its length
null: checks if the list is empty (returns TRUE if it is)
reverse: reverses a list
take: takes a number and a list; then extracts that many items from the list
drop: takes a number and a list; then drops that many items from the beginning of a list
maximum: retunrs max value from the list
minimum: returns min value from the list
sum: takes a list of numbers and returns the sum
product: takes a list of numbers and returns their product
elem: checks if the item is in the list
foldl: folds a list into a number by applying the passed fuction

=====RANGES=====
cycle: takes a list and cycles it into infinite list; typically used with take
	take 10 (cycle [1,2,3])
repeat: takes element and produces infinite list of it
	take 10 (repeat 5)
replicate: replicates the number certain times
	replicate 3 10

=====TUPLES=====
fst: takes a pair and returns the first item (works only on pairs)
snd: takes a pair and returns the second item (works only on pairs)
zip: takes two lists and then zips them together into one list by joining the matching elements into pairs

=====MODULES=====
Here is a link to check all the modules: https://downloads.haskell.org/~ghc/latest/docs/html/libraries/

Data.List
	nub: takes a list and weeds out the duplicate elements
	intersperse: takes an element and a list and then puts that element in between each pair of elements in the list; [1,0,2,0,3,0,4,0,5,0,6]  
	intercalate: takes a list of lists and a list. It then inserts that list in between all those lists and then flattens the result; intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]] -> [1,2,3,0,0,0,4,5,6,0,0,0,7,8,9]  
	transpose: transposes a list; transpose [[1,2,3],[4,5,6],[7,8,9]] -> [[1,4,7],[2,5,8],[3,6,9]]
	concat: flattens the list of lists to just list of elements [[3,4,5],[2,3,4],[2,1,1]] -> [3,4,5,2,3,4,2,1,1]  
	and: takes a list of bool values and returns true if all are true
	or: same as end, takes a list of Bool and returns true if at least one is True
	any / all: take a predicate and check if any/all values in the list satisfy the predicate
	iterate: takes a function and a starting value. It applies the function to the starting value, then it applies that function to the result, then it applies the function to that result again, etc. It returns all the results in the form of an infinite list
	splitAt: takes a number and a list. It then splits the list at that many elements, returning the resulting two lists in a tuple
	takeWhile: It takes elements from a list while the predicate holds and then when an element is encountered that doesn't satisfy the predicate, it's cut off
	dropWhile: is similar, only it drops all the elements while the predicate is true. Once predicate equates to False, it returns the rest of the list
	sort: sorts the list
	group: takes a list and groups adjacent elements into sublists if they are equal
	inits / tails: are like init and tail, only they recursively apply that to a list until there's nothing left.
	isInfixOf: searches for a sublist within a list and returns True if the sublist we're looking for is somewhere inside the target list
	isPrefixof / isSuffixOf: search for a sublist at the beginning and at the end of a list, respectively
	elem /notElem: check if the element is /isn't part of the list
	partition: takes a list and a predicate and returns a pair of lists. The first list in the result contains all the elements that satisfy the predicate, the second contains all the ones that don't
			   While span and break are done once they encounter the first element that doesn't and does satisfy the predicate, partition goes through the whole list and splits it up according to the predicate.
	find: takes a list and predicate and retunrs the first element that satisifes the predicate
		  find retunrs the Maybe type (if there is value it returns "Just <value>", if there is nothing, it retunrns "Nothing")
	elemIndex: based on the value and list, returns maybe the index of the list
	elemIndices: returns the list of indices for the element, if it is present in the list for multiple times
	findIndex: is like find, but it maybe returns the index of the first element that satisfies the predicate
	findIndices: returns the indices of all elements that satisfy the predicate in the form of a list
	zipWith: It takes a function and two lists as parameters and then joins the two lists by applying the function between corresponding elements.
	zip: takes two lists and then zips them together into one list by joining the matching elements into pairs
	zip2 / zip3 / zip4: same as zip but for multiple lists
	lines: is a useful function when dealing with files or input from somewhere. It takes a string and returns every line of that string in a separate list
	unlines: s the inverse function of lines. It takes a list of strings and joins them together using a '\n'
	words / unwords: splitting a line of text into words or joining a list of words into a text.
	nub: It takes a list and weeds out the duplicate elements, returning a list whose every element is a unique snowflake!
	delete: takes an element and a list and deletes the first occurence of that element in the list
	\\: s the list difference function. It acts like a set difference, basically. For every element in the right-hand list, it removes a matching element in the left one
	intersect: works like set intersection. It returns only the elements that are found in both lists
	insert: takes an element and a list of elements that can be sorted and inserts it into the last position where it's still less than or equal to the next element. In other words, insert will start at the beginning of the list and then keep going until it finds an element that's equal to or greater than the element that we're inserting and it will insert it just before the element
	deleteBy / numBy / unionBy / intersectBy / groupBy: similar but let to specify the condition
	sortBy / insertBy / maximumBy / minimumBy: same but let you specify the condition

Data.Char (functions take a character and decide whether some condition about it is true)
	isControl - checks whether a character is a control character
	isSpace - hecks whether a character is a white-space characters. That includes spaces, tab characters, newlines, etc
	isLower - checks whether a character is lower-cased
	isUpper - checks whether a character is upper-cased
	isAlpha - checks whether a character is a letter
	isAplhaNum - checks whether a character is a letter or a number
	isPrint - checks whether a character is printable. Control characters, for instance, are not printable
	isDigit - checks whether a character is a digit
	isOctDigit - checks whether a character is an octal digit
	isHexDigit - checks whether a character is a hex digit
	isLetter - checks whether a character is a letter
	isMark - checks for Unicode mark characters. Those are characters that combine with preceding letters to form latters with accents. Use this if you are French
	isNumber - checks whether a character is numeric
	isPunctuation - checks whether a character is punctuation
	isSymbol - checks whether a character is a fancy mathematical or currency symbol
	isSeparator - checks for Unicode spaces and separators
	isAscii - checks whether a character falls into the first 128 characters of the Unicode character set
	isLatin1 - checks whether a character falls into the first 256 characters of Unicode
	isAsciiUpper - checks whether a character is ASCII and upper-case
	isAsciiLower -  checks whether a character is ASCII and lower-case
	generalCategory - takes char and tells us what category it belongs to
	toUpper - converts cahracted to upper case
	toLower - converts character to lower case
	toTitle - converts a character to title-case. For most characters, title-case is the same as upper-case
	digitToInt - converts a character to an Int. To succeed, the character must be in the ranges '0'..'9', 'a'..'f' or 'A'..'F'
	intToDigit - is the inverse function of digitToInt. It takes an Int in the range of 0..15 and converts it to a lower-case character
	ord / char - converts character to unicode related number
	
Data.Map (provides the functions to work with dictionaries)
	The most obvious way to represent the dictionary is to create the list of pairs
	Data.Map imports the functions that clash with Prelude, we have to do qualified import
	 import qualified Data.Map as Map  
	When working with Data.Map all the keys have to be orderable (belong to Ord typeclass)
	You can either work with associations lists or you can work with maps (data type created by fromList)

	fromList: function takes an association list (in the form of a list) and returns a map with the same associations
	empty: retunrs an emplty map
	insert: takes a key, a value and a map and returns a new map that's just like the old one, only with the key and value inserted
	null: checks if a null is empty
	size: reports the size of the map
	singleton: takes a key and a value and creates a map that has exactly one mapping
	lookup: works like the Data.List lookup, only it operates on maps. It returns Just something if it finds something for the key and Nothing if it doesn't.
	member: takes a key and a map and reports whether the key is in the map or not.
	map / filter: work much like their list equivalents.
	toList: is the inverse of fromList.
	keys / elems: return lists of keys and values respectively. keys is the equivalent of map fst . Map.toList and elems is the equivalent of map snd . Map.toList.
	fromListWith: It acts like fromList, only it doesn't discard duplicate keys but it uses a function supplied to it to decide what to do with them.
	insertWith: is to insert what fromListWith is to fromList. It inserts a key-value pair into a map, but if that map already contains the key, it uses the function passed to it to determine what to do

Data.Set
	This module offers us sets.
	All the elements in sets are unique
	Since they are implemented with trees they are ordered
	To import you use:
		import qualified Data.Set as Set  
	
	fromList: takes a list and converts it into a set
	intersection: function to see which elements they both share.
	difference: function to see which letters are in the first set but aren't in the second one and vice versa.
	union: all the unique letters used in both sentences
	




















-}
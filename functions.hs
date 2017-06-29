{-

succ: takes anything and returns the successor (input 8 will return 9)
min: returns lesser argument (min 4 6)
max: returns bigger argument (max 4 5)
div: take the division without remainder (div 92 10 - returns 9)
show: takes a value and presents it to us in the form of a string
read: is the opposity of show; takes the string as input and identofies the type of itmn
odd: checks if the integral number is odd

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

-}
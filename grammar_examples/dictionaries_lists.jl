
# Dictionaries
#
# Dictionary is ment to be a "swiss army knife" of our language.
# It is meant to be a scripting thing, that you do not want to 
# use in highly optimized code, but it should cause no trouble.
# "PLUG & PLAY"
# Features:
# * by default, it is not typed
# * it is able to store everything as a key and value
# * IT IS ORDERED
dict : {} 
dict : { 'a' : 1, 'b' : 2, 'c' : 3 }
dict : { 
	'a' : 1, 
	'b' : 2, 
	'c' : 3
}

dict[ind] 
dict.get(key, default)
dict.get(key)
dict.nth(ind) # ordered!
# it is ordered in order to be able to discover the order in which elements has been added, for instance. 

Lists:

list : []
list : [1,2,3]
list[ind]
list.get(ind)
list.nth(ind)
list[0..]
list[0..2..]
list[1..2..]
list[1..-1]
list.slice(a, b, step=2)

# List, moveover, is a swiss knife implementation of a list.
# It can easily store eveything etc.
# The proper arrays are initilised differently.
# They can store only specified type, and have constant size.

arr : Array[1,2,3,4] -> Array{i32, 1}(length=4)

# Overall, we want the lists, sets and dictionaries to be c"compile time values" 
# So, in case when a field is typed, we coerce this into a value of a given type

arr Array : [1,2,3,4] 
assert arr == Array[1,2,3,4]
















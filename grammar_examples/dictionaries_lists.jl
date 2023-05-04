
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



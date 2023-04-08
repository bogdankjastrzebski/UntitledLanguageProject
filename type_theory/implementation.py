
# An implementation of the type theory proposal

# def foo(x: int) -> int:
# 	  return x + x 
# 
#
#
#
#
#

# A function has a rule assotiated with it.
# It says, if the input is obeys a, then the output obeys b. 

class Nil:
	pass

class SuperObject:
	def __init__(self, value):
		self.value = value	
	def __getattr__(self, name):
		if hasattr(self, name):
			return self.__getattr__(name)
		return Nil()

class SuperFunction:
	def __init__(self, name, operation): 
		pass




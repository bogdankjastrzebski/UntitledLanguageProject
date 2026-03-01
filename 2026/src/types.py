# src/types.py

class MachineType:
    """Base class for raw hardware memory layouts."""
    pass

class MachineInt(MachineType):
    def __init__(self, bits=32):
        self.bits = bits
    def __repr__(self): return f"i{self.bits}"
    def __eq__(self, other): return isinstance(other, MachineInt) and self.bits == other.bits
    def __hash__(self): return hash(("int", self.bits))

class MachineFloat(MachineType):
    def __init__(self, bits=64):
        self.bits = bits
    def __repr__(self): return f"f{self.bits}"
    def __eq__(self, other): return isinstance(other, MachineFloat) and self.bits == other.bits
    def __hash__(self): return hash(("float", self.bits))

class MachineProduct(MachineType):
    """A C-Struct layout (Sequential memory)."""
    def __init__(self, *types):
        self.types = types
    def __repr__(self): return f"Product({', '.join(map(str, self.types))})"
    def __eq__(self, other): return isinstance(other, MachineProduct) and self.types == other.types
    def __hash__(self): return hash(("product", self.types))

class MachineSum(MachineType):
    """A Tagged Union layout (Overlapping memory with an i8 tag)."""
    def __init__(self, *types):
        self.types = types
    def __repr__(self): return f"Sum({', '.join(map(str, self.types))})"
    def __eq__(self, other): return isinstance(other, MachineSum) and self.types == other.types
    def __hash__(self): return hash(("sum", self.types))


# --- INTERPRETER BOXES ---

class PrimalBox:
    """Concrete data with a user-land label attached (Type Erasure target)."""
    def __init__(self, label, value):
        self.label = label
        self.value = value
        
    def __repr__(self): 
        return f"[{self.label}: {self.value}]"
        
    def __eq__(self, other): 
        return isinstance(other, PrimalBox) and self.label == other.label and self.value == other.value
        
    def __hash__(self): 
        return hash((self.label, self.value))

class AbstractVal:
    """The '?:Label' unknown value used for symbolic theorem proving."""
    def __init__(self, label):
        self.label = label
        
    def __repr__(self): 
        return f"<?:{self.label}>"
        
    def __eq__(self, other): 
        return isinstance(other, AbstractVal) and self.label == other.label
        
    def __hash__(self): 
        return hash(self.label)

class UnionVal:
    """Represents a fork in the universe (Idempotent Set)."""
    def __init__(self, *items):
        self.possibilities = set()
        for item in items:
            if isinstance(item, UnionVal):
                self.possibilities.update(item.possibilities)
            else:
                self.possibilities.add(item)
                
    def collapse(self):
        """If the universe converges to a single timeline, unwrap it."""
        if len(self.possibilities) == 1:
            return list(self.possibilities)[0]
        return self
            
    def __repr__(self):
        collapsed = self.collapse()
        if not isinstance(collapsed, UnionVal):
            return repr(collapsed)
        return f"Union({', '.join(map(repr, self.possibilities))})"
        
    def __eq__(self, other):
        return isinstance(other, UnionVal) and self.possibilities == other.possibilities

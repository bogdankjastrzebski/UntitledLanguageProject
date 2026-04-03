# MetaLisp v0.1

MetaLisp is a symbolic-execution compiler and theorem prover that bridges the gap between high-level functional Lisp and bare-metal, dependency-free C-compatible binaries.

## The Design Philosophy: Primal/Dual Types
Unlike standard compilers, MetaLisp separates logic into two layers:
1. **Primal Types (Data):** Simple memory layouts (`Product`, `Sum`, `Int`, `Float`) tagged with user-land labels.
2. **Dual Types (Predicates):** Chronological dispatch functions that act as predicates. 

## Core Architectural Innovations

### 1. Chronological Multiple Dispatch
Instead of static v-tables, MetaLisp uses an ordered registry of `[Predicate, Implementation]` pairs. The `dispatch` router iterates through this list from **newest to oldest**. This allows users to "hot-patch" functions by injecting new, stricter predicates at the head of the list without modifying the original source or breaking broader fallbacks.

**Example: Hot-patching an integer description**
```lisp
; A broad, older fallback
(define fallback (make-method Int? (lambda (x) "Just an integer")))

; A new, stricter implementation injected at the head of the list
(define describe-registry (cons (make-method PositiveInt? 
                                            (lambda (x) "Positive!"))
                                (cons fallback empty)))

; The router checks predicates from newest to oldest.
(dispatch describe-registry (box "Int" 10)) ; => "Positive!"
(dispatch describe-registry (box "Int" -5)) ; => "Just an integer"
```

### 3. F-Expression Capability
By capturing environments within closures (`lambda` capturing `env`), MetaLisp functions act as F-expressions. They receive their unevaluated arguments and the surrounding scope, allowing for the construction of macros (like `add-method`) that manipulate the compiler's own environment.


The interpreter doesn't just calculate; it proves. When the compiler encounters an `if` statement with an unknown type (`AbstractVal`), it forks the universe, executing both the `true` and `false` branches symbolically. The result is a `UnionVal` that tracks all potential outcomes, providing static exhaustiveness checking for your dispatch logic.


You defined the `if` statement not as a language keyword, but as a branching function (an F-expression) that manipulates the environment and code blocks.

### Your Definition of `if`
We agreed that `if` is a function defined as: `(if env pred case_a case_b)`

It operates by:
1. **Environment Handling:** Accepting the current `env` and two unevaluated code blocks (`case_a`, `case_b`).
2. **Predication:** Evaluating `(pred env)` to determine the path.
3. **Branching Logic:**
   - `pred(env) == true` → Returns `case_a(env)`
   - `pred(env) == false` → Returns `case_b(env)`
   - `pred(env) == ?` (Unknown/Abstract) → Returns `case_a(env) || case_b(env)` (The Union/Branch Fork)



### The Core Ideas Summary
To ensure we are aligned, here is the architecture we are building:

* **F-Expression Foundations:** Every "statement" (like `if`, `define`, `lambda`) is a function that receives the current `env` and the code expressions as unevaluated arguments. This gives the user total control over evaluation order and scope.
* **Environment as State:** `env` is the first-class object passed to every expression. Whether you are reading a variable or branching, you are passing the state forward. This allows for clean, functional state transitions.
* **Symbolic Branching (The "Universe Fork"):** When the predicate evaluation returns an `AbstractVal` (the `?` state), the interpreter doesn't crash or guess; it returns a `UnionVal` of both possible branches.
* **Idempotence/Collapse:** Because `case_a(env) || case_a(env) == case_a(env)`, the compiler automatically detects when branches are logically equivalent and collapses them, preventing "path explosion" in your code.
* **Element-wise Mapping:** Any operation performed on a `UnionVal` is automatically mapped over all possibilities, meaning your type system automatically handles logic for sets of potential types without you needing to write specialized dispatch code.

Does this accurately reflect the `if` architecture you proposed, or did I miss a nuance in how those code blocks (`case_a`, `case_b`) interact with the environment?

## Current Status

### ✅ Implemented
* **Frontend:** S-expression tokenizer/parser that handles string quoting and comment stripping.
* **Middle-End:** MetaCompiler with lexical closures, `AbstractVal` (symbolic types), and `UnionVal` (universe merging).
* **Backend:** LLVM IR emitter utilizing PHI nodes to bridge divergent branches into SSA form.
* **FFI:** AOT Linker that generates `.so` shared libraries with `.meta` JSON sidecars for cross-language compatibility.
* **Dispatch System:** A recursive `dispatch` router implemented in `stdlib.lisp` that uses chronological lookups.

### 🚧 Roadmap & TODO
* [ ] **Macro System:** Formalize `(define-macro ...)` syntax to abstract `cons`/`first`/`rest` calls.
* [ ] **String Primitive Support:** Add `len`, `concat`, and `substring` to the backend.
* [ ] **CLI Tooling:** Create a CLI to compile files directly: `python main.py compile program.lisp`.
* [ ] **Array/Buffer Primitives:** Implement a full memory management unit for large-scale data handling.
* [ ] **Static Dispatch Optimization:** Backend pass to inline dispatch tables for stable predicate chains.

## How it works
1. **Eval:** You define a function with a Dual Type predicate.
2. **Infer:** The `MetaCompiler` runs the code symbolically using `AbstractVal`.
3. **Compile:** The `LLVMBackend` translates the evaluated logic to native instructions.
4. **Link:** `FFIManager` creates a binary that is "blind" to the Lisp interpreter, running purely on the hardware.

---
*Built with passion, LLVM, and a complete disregard for traditional compiler boundaries.*


; lib/stdlib.lisp

; ==========================================
; 1. DUAL TYPES (Type Predicates)
; ==========================================
(define (Int? x) (machine-eq (get-label x) "Int"))
(define (Float? x) (machine-eq (get-label x) "Float"))
(define (Any? x) "True")

; A Dependent Type! Must be an Int AND greater than zero.
(define (PositiveInt? x)
    (if (Int? x)
        (machine-gt (get-value x) 0)
        "False"))

; ==========================================
; 2. BASIC MATH
; ==========================================
(define (+ a b) (machine-add a b))
(define (> a b) (machine-gt a b))
(define (== a b) (machine-eq a b))

; ==========================================
; 3. C-STRUCTS (Primal Product Types)
; ==========================================
; We define a 'Point' struct which takes 2 slots in memory (X and Y).

(define (make-point x y)
    ; Allocate 2 slots, set index 0 to x, index 1 to y, and box it with "Point"
    (box "Point" 
        (machine-set 
            (machine-set (machine-alloc 2) 0 x) 
            1 y)))

(define (point-x p) (machine-get (get-value p) 0))
(define (point-y p) (machine-get (get-value p) 1))

; A function using our Struct
(define (shift-point-x p amount)
    (make-point (+ (point-x p) amount) (point-y p)))

; A global registry holding our dispatch lists
(define *registry* (machine-alloc 100)) ; (We'd use a real dictionary in a full build)

; The router that iterates through the list of implementations
(define (dispatch methods arg)
    (if (empty? methods)
        (box "Error" "No matching method found!")
        (if ((get-predicate (first methods)) arg)   ; If the Dual Type predicate returns true...
            ((get-body (first methods)) arg)        ; ...execute the body!
            (dispatch (rest methods) arg))))        ; Else, check the next older method.

; ==========================================
; 4. PRIMAL/DUAL DISPATCH ROUTER
; ==========================================

; Create an empty list by allocating an array of size 0
(define empty (machine-alloc 0))

; A method is just a list containing [Predicate, Body]
(define (make-method pred body)
    (cons pred (cons body empty)))

(define (method-pred m) (first m))
(define (method-body m) (first (rest m)))

; The core router: iterates through a list of methods.
; Checks the predicate. If true, runs the body. Else, checks the next method.
(define (dispatch methods arg)
    (if (empty? methods)
        (box "Error" "No matching method found!")
        (if ((method-pred (first methods)) arg)
            ((method-body (first methods)) arg)
            (dispatch (rest methods) arg))))

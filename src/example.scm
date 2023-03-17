
(define (number->church n)
	(if (= n 0)
		(lambda (f) (lambda (x) x))
		(let ((prev (number->church (- n 1))))
			(lambda (f) (lambda (x) (f ((prev f) x))))))) 


(defconst ch-zero  (number->church 0))
(defconst ch-one   (number->church 1))
(defconst ch-two   (number->church 2))
(defconst ch-three (number->church 3))

(define (church->number n)
	((n (lambda (x) (+ x 1))) 0))

(define (((ch+ a b) f) x) 
	((a f) ((b f) x)))

(define (((ch* n m) f) x)
	((n (m f)) x))

(define (((ch-pred n) f) x) 
	(((n (lambda (g) (lambda (h) (h (g f))))) (lambda (u) x)) (lambda (u) u)))


 

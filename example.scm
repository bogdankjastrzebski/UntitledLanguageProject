
(define (filter pred arr)
    (let add-or-discard ((acc '()) (arr arr))
        (if (null? arr)
            acc
            (add-or-discard 
                (if (pred (car arr))
                    (cons (car arr) acc)
                    acc)
                (cdr arr)))))

(filter odd? (list 0 1 2 4 5 6))

(define (quicksort arr)
  (if (null? arr)
    arr
    (append
      (quicksort (filter
                   (lambda (n) (< n (car arr)))
                   (cdr arr)))
      (cons (car arr)
      (quicksort (filter
                   (lambda (n) (>= n (car arr)))
                   (cdr arr)))))))

(quicksort '(7 3 4 3 2 5 6 7))

(quicksort '(3 4 3 2 3 4 5 4 23 2))

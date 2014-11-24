(define (unless condition usual-value exceptional-value)
  (map display (list "calling unless with condition " condition "\n"))
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless (= n 1)
    (* n (factorial (- n 1)))
    1))

(factorial 5)

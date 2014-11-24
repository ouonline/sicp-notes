(define (my-cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (count z base)
  (if (= (remainder z base) 0)
    (+ 1 (count (/ z base) base))
    0))

(define (my-car z)
  (count z 2))

(define (my-cdr z)
  (count z 3))

; ------------------------------------

(my-car (my-cons 4 9))
(my-cdr (my-cons 4 9))

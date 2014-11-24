(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (fast-mul a b)
  (cond ((= b 1) a)
        ((even? b) (fast-mul (double a) (halve b)))
        (else (+ a (fast-mul a (- b 1))))))

; -----------------------------------------------------------

(fast-mul 3 7)

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (fast-mul a b result)
  (cond ((= b 0) result)
        ((even? b) (fast-mul a (halve b) (+ result (double a))))
        (else (fast-mul a (- b 1) (+ result a)))))

; -----------------------------------------------------------

(fast-mul 6 6 0)

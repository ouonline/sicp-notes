(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n tested-divisor)
  (cond ((> (square tested-divisor) n) n)
        ((divides? tested-divisor n) tested-divisor)
        (else (find-divisor n (+ tested-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

; -------------------------------------------------------------

(smallest-divisor 19999)

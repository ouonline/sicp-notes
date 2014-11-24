(define (filtered-accumulate combiner null-value term a next b my-filter)
  (define (func x)
    (filtered-accumulate combiner null-value term x next b my-filter))

  (cond ((> a b) null-value)
        ((my-filter a) (combiner (term a) (func (next a))))
        (else (func (next a)))))

; ---------------------------------------------------------------------

(load "1.22.scm")

(define (inc x) (+ x 1))
(define (identity x) x)

(define (func-a a b)
  (define (prime? x)
    (= (smallest-divisor x) x))

  (filtered-accumulate + 0 identity a inc b prime?))

(define (func-b a b)
  (define (relative-prime? x)
    (if (= x b)
      #f
      (= (gcd x b) 1)))

  (filtered-accumulate * 1 identity a inc b relative-prime?))

; ---------------------------------------------------------------------

(func-a 1 20)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

; ---------------------------------------------------------------------

(define (inc x) (+ x 1))
(define (identity x) x)

;(accumulate + 0 identity 1 inc 100)
(accumulate * 1 identity 1 inc 6)

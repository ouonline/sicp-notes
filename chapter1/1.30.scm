(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

; --------------------------------------------------------

(define (inc x) (+ x 1))
(define (identity x) x)

(sum identity 1 inc 100)

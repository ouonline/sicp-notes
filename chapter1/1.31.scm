(define (product-recur term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-recur term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

; --------------------------------------------------------

(define (inc x) (+ x 1))
(define (identity x) x)

(product-recur identity 1 inc 3)

; n is even
(define (compute-pi n)
  (define (next a) (+ a 2))
  (define (term a) (* a a))
  (define (div n)
    (/ (* (product-recur term 4 next (- n 2)) n)
       (product-iter term 3 next (- n 1))))
  
  (* 8 (div n)))

(compute-pi 1000)

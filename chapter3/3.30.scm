(define (ripple-carry-adder addend augend sum carry)

  (define (recur a b s)
    (if (null? (cdr a))
      (begin (full-adder (car a) (car b) 0 s carry)
             (set-car! sum s))
      (begin (recur (cdr a) (cdr b) s)
             (full-adder (car a) (car b) carry s carry)
             (set! sum (cons s sum)))))

  (if (and (not (null? addend))
           (not (null? augend))
           (= (length addend) (length augend)))
    (recur addend augend '())))

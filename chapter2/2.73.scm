(define (install-deriv-package)

  (define (deriv-sum expression var)
    (make-sum ((get 'deriv (operator expression)) (addend expression) var)
              ((get 'deriv (operator expression)) (augend expression) var)))
  
  (define (deriv-product expression var)
    (make-sum (make-product (multiplier expression)
                            ((get 'deriv (operator expression)) (multiplicand expression) var))
              (make-product ((get 'deriv (operator expression)) (multiplier expression) var)
                            (multiplicand expression))))
  
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  'done)

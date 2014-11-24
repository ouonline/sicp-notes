(define (install-polynomial-package)
  (define (negative-poly p)
    (define (neg-term t)
      (make-term (order t) (negative (coeff t))))

    (map neg-term (term-list p)))

  (put 'negative '(polynomial) negative-poly)
  (put 'sub '(polynomial polynomial) (lambda (x y)
                                       (add-poly x (negative-poly y)))))

(define (remainder-terms  a b)
  (cadr (div-terms a b)))

(define (gcd-poly p1 p2)
  (if (not (eq? (variable p1) (variable p2)))
    (error "...")
    (make-poly (variable p1)
               (gcd-terms (term-list p1) (term-list p2)))))

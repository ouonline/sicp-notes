(define (adjoin-term term term-list)
  (define (adjoin-helper current-order result)
    (cond ((> (order term) current-order)
           (adjoin-helper (+ current-order 1) (append (list 0) result))
           ((= (order term) current-order)
            (append (list (order term)) result))))

    (if (=zero? (coeff term))
      term-list
      (adjoin-helper term-list (length term-list) '()))))

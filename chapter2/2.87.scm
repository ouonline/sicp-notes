(define (install-polynomial-package)
  (put '=zero? '(polynomial)
       (lambda (x)
         (if (eq? (type-tag x) 'polynomial)
           (empty-termlist? x)
           (=zero? x)))))

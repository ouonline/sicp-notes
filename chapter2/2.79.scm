(define (install-scheme-number-package)
  (put 'equ? (scheme-number scheme-number)
       (lambda (x y) (= x y))))

(define (install-rational-package)
  (put 'equ? (rational rational)
       (lambda (x y) (and (= (numer x) (numer y))
                          (= (denom x) (denom y))))))

(define (install-complex-package)
  (put 'equ? (complex complex)
       (lambda (x y) (and (= (magnitude x) (magnitude y))
                          (= (angle x) (angle y))))))

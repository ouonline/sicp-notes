; integer -> rational
(define (install-integer-package)
  (put 'raise '(integer)
       (lambda (x) (make-rat (contents x) 1))))

; rational -> real
(define (install-rational-package)
  (define (make-real x)
    (attach-tag 'real x))

  (put 'raise '(rational)
       (lambda (x) (make-real (/ (numer x) (denom x))))))

; real -> complex
(define (install-real-package)
  (put 'raise '(real)
       (lambda (x) (make-complex-from-real-imag (contents x) 0))))

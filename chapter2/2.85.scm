; rational -> integer
(define (install-rational-package)
  (define (make-integer x)
    (attach-tag 'integer x))

  (put 'drop '(rational)
       (lambda (x)
         (let ((result (/ (numer x) (demon x))))
           (if (= (round result) result)
             (make-integer result)
             x)))))

; real -> rational -> integer
(define (install-real-package)
  (define (project x)
    (make-rat (contents x) 1))

  (define (drop x)
    ((get 'drop '(rational)) (project x)))

  (put 'drop '(real) drop))

; complex -> real -> rational -> integer
(define (install-complex-package)
  (define (make-real x)
    (attach-tag 'real x))

  (define (drop x)
    (if (= (imag-part x) 0)
      ((get 'drop '(real)) (make-real (real-part x)))
      x))

  (put 'drop '(complex) drop))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply-generic 'drop (apply proc (map contents args)))
        (error
          "No method for these types -- APPLY-GENERIC"
          (list op type-tags))))))

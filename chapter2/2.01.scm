(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

; -------------------------------------------

(define (make-rat n d)
  (if (or (and (> n 0) (< d 0))
          (and (< n 0) (< d 0)))
    (cons (- n) (- d))
    (cons n d)))

(print-rat (make-rat -3 -4))

(load "3.3.5-propagation-of-constraints.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c- z x)
  (let ((y (make-connector)))
    (adder x y z)
    y))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ z x)
  (let ((y (make-connector)))
    (multiplier x y z)
    y))

(define (cv value)
  (let ((v (make-connector)))
    (constant value v)
    v))

; -----------------------------------------------------------------

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9)
              (cv 5))
          x)
      (cv 32)))

(define C (make-connector))
(probe "C" C)
(set-value! C 100 'ou)

(define F (celsius-fahrenheit-converter C))
(probe "F" F)

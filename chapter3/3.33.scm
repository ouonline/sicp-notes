(load "3.3.5-propagation-of-constraints.scm")

(define (averager a b c)
  (let ((x (make-connector))
        (u (make-connector)))
    (adder a b u)
    (multiplier x c u)
    (constant 2 x))
  'ok)

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))

(probe "value a" a)
(probe "value b" b)
(probe "value c" c)

(set-value! a 12 'ou)
(set-value! b 36 'ou)
(averager a b c)

(load "3.3.5-propagation-of-constraints.scm")

(define (squarer a b)
  (multiplier a a b))

(define a (make-connector))
(define b (make-connector))

(probe "a" a)
(probe "b" b)

(set-value! a 5 'ou)
(squarer a b)

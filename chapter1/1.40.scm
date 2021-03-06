(load "1.3.4-newtons-method.scm")

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))

(newtons-method (cubic 3 4 5) 1)

(load "4.12.scm")
(load "utils.scm")

(define (make-unbound! var env)
  (env-loop var env
            (lambda (vars vals)
              (remove-first! vars)
              (remove-first! vals)
              #t)))

; -------------------------------------------

testenv
(make-unbound! 'f testenv)
testenv

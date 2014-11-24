(load "4.1-the.metacircular.evaluator.scm")

(my-eval '(define x 3) #f)

(define (application? expression) (tagged-list? expression 'call))

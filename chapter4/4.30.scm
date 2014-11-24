(load "4.1-the.metacircular.evaluator.scm")

(define str1 '(define (p1 x)
                (set! x (cons x '(2)))
                x))

(define str2 '(define (p2 x)
                (define (p e)
                  e
                  x)
                (p (set! x (cons x '(2))))))

(define testenv (list (make-frame '(a b c) '(1 2 3))))

;(my-eval str1 testenv)
(my-eval str2 testenv)

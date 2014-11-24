(load "4.1-the.metacircular.evaluator.scm")

(define (let->combination expression)
  (let ((let-list (cadr expression))
        (let-body (cddr expression)))
    (let ((var-list (map car let-list))
          (exp-list (map cadr let-list)))
      (cons (make-lambda var-list let-body)
            exp-list))))

; ------------------------------------------------------------

(define str '(let ((a 1) (b 2) (c 3))
               (+ a b)))

(let->combination str)

(load "4.1-the.metacircular.evaluator.scm")

(define (named-let? expression)
  (and (pair? expression)
       (not (pair? (cadr expression)))))

(define (named-let->combination expression)
  (let* ((var-name (cadr expression))
         (let-list (caddr expression))
         (arg-list (map car let-list))
         (arg-init (map cadr let-list))
         (let-body (cdddr expression)))
    (list 'let
          (list (list var-name
                      (make-lambda arg-list let-body)))
          (cons var-name arg-init))))

; ------------------------------------------------------------

(define str '(let fib-iter ((a 1)
                            (b 0)
                            (count n))
               (if (= count 0)
                 b
                 (fib-iter (+ a b) a (- count 1)))))

(named-let->combination str)

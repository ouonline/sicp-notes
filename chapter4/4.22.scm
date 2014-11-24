(load "4.06.scm")

(define (analyze-let expression)
  (lambda (env)
    ((analyze-lambda (let->combination expression)) env)))

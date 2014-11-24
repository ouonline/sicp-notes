(define (my-eval expression env)
  (cond
    ((self-evaluating? expression)
     expression)
    (else
      ((get 'my-eval (operator expression)) (operands expression) env))))

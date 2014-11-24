(define (list-of-values-lr exps env) ; evaluates from left to right
  (if (no-operands? exps)
    '()
    (let ((first-value (eval (first-operand exps) env)))
      (cons first-value
            (list-of-values (rest-operands exps) env)))))

(define (list-of-values-rl exps env) ; evaluates from right to left
  (if (no-operands? exps)
    '()
    (let ((rest-exp (rest-operands exps)))
      (cons (eval (first-operand exps) env)
            (list-of-values rest-exp env)))))

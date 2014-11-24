(define (cond=>? expression)
  (let ((first (car expression))
        (rest (cdr expression)))
    (if (null? rest)
      #f
      (if (pair? rest)
        (if (eq? (car rest) '=>)
          #t
          #f)
        #f))))

(define (eval-cond=> expression env)
  (let ((result (my-eval (car expression) env))
        (recipient (cddr expression)))
    (if result
      (my-eval (recipient result) env))))

(define (eval-cond expression env)
  (if (cond=>? expression)
    (eval-cond=> expression env)
    (my-eval (cond->if expression))))

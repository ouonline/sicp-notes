(define (and? expression)
  (tagged-list? expression 'and))

(define (eval-and expression env)
  (define (and-true? arglist)
    (if (no-operands? arglist)
      #t
      (and (my-eval (first-operand arglist) env)
           (and-true? (rest-operands arglist)))))

  (and-true? (cdr expression)))

(define (or? expression)
  (tagged-list? expression 'or))

(define (eval-or expression env)
  (define (or-true? arglist)
    (if (no-operands? arglist)
      #f
      (or (my-eval (first-operand arglist) env)
          (or-true? (rest-operands arglist)))))

  (or-true? (cdr expression)))

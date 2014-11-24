(load "4.1-the.metacircular.evaluator.scm")

(define (scan-out-defines proc-body)

  (define (get-definition-list body)
    (cond ((null? body)
           '())
          ((not (definition? (car body)))
           '())
          (else
            (append (list (list (definition-variable (car body))
                                (definition-value (car body))))
                    (get-definition-list (cdr body))))))

  (define (get-other-parts body)
    (cond ((null? body)
           '())
          ((not (definition? (car body)))
           body)
          (else (get-other-parts (cdr body)))))

  (define (var->list var-list)
    (if (null? var-list)
      '()
      (append (list (list (car var-list) ''*unassigned*))
              (var->list (cdr var-list)))))

  (define (val->list definition-list)
    (map (lambda (x) (append (list 'set! (car x)) (cdr x))) definition-list))

  (define (definition->let definition-list)
    (define (recur l)
      (if (null? l)
        '()
        (append (list 'let)
                (list (var->list (map car l)))
                (val->list l))))

    (recur definition-list))

  (append (definition->let (get-definition-list proc-body))
          (get-other-parts proc-body)))

; ------------------------------------------------------------

(define body-str '((define (even? n) (if (= n 0) true (odd?  (- n 1))))
                   (define (odd? n) (if (= n 0) false (even? (- n 1))))
                   #t))

(scan-out-defines body-str)

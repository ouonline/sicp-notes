(define (let*->nested-lets expression)

  (let ((let*-list (cadr expression))
        (let*-body (cddr expression)))

    (define (make-nested-lets var-list)
      (if (null? (cdr var-list))
        (append (list 'let)
                (list (list (car var-list)))
                let*-body)
        (list 'let
              (list (car var-list))
              (make-nested-lets (cdr var-list)))))

    (make-nested-lets let*-list)))

; -----------------------------------------------------------

(define str '(let* ((x 3)
                    (y (+ x 2))
                    (z (+ x y 5)))
               (* x z)
               (+ y z)))

(let*->nested-lets str)

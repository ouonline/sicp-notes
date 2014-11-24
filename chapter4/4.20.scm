(define (letrec-assign-body expression)
  (cadr expression))

(define (letrec-expression expression)
  (cdr (cdr expression)))

(define (letrec-variables body)
  (map car body))

(define (letrec-values body)
  (map cadr body))

(define (variables->list var-list)
  (map (lambda (x) (list x ''*unassigned*)) var-list))

(define (values->list val-list)
  (map (lambda (x) (list 'v x)) val-list)) ; FIXME: assign tmp variables

(define (associate-vars var-list val-list)
  (map (lambda (x y) (list 'set! x (car y)))
       var-list (values->list val-list)))

(define (letrec->let expression)
  (let* ((body (letrec-assign-body expression))
         (var-list (letrec-variables body))
         (val-list (letrec-values body)))
    (append (list 'let) (list (variables->list var-list))
            (list (append (list 'let) (list (values->list val-list))
                          (associate-vars var-list val-list)))
            (letrec-expression expression))))

; ---------------------------------------------

(define str '(letrec
               ((even? (lambda (n)
                         (if (= n 0)
                           #t
                           (odd?  (- n 1)))))
                (odd? (lambda (n)
                        (if (= n 0)
                          #f
                          (even? (- n 1))))))
               (even? x)
               (old? x)))

(letrec->let str)

(define (apply-generic op . args)

  (define (find-highest-type args)

    (define (can-raise? arg1 t2)
      (let ((raise (get 'raise (type-tag arg1))))
        (if raise
          (let ((raised-result (raise arg1)))
            (if (eq? (type-tag raised-result) t2)
              #t
              (can-raise? raised-result t2)))
          #f)))

    (define (find-higher arg1 arg2)
      (let ((t1 (type-tag arg1))
            (t2 (type-tag arg2)))
        (cond ((eq? t1 t2) arg1)
              ((can-raise? arg1 t2) arg2)
              (else arg1))))

    (define (find-highest-helper arg1 args)
      (if (null? args)
        (type-tag arg1)
        (find-highest-helper (find-higher arg1 (car args)) (cdr args))))

    (find-highest-helper (car args) (cdr args)))

  (define (raise-to args t)
    (define (raise-to-helper arg)
      (let ((raise (get 'raise (type-tag arg))))
        (if raise
          (let ((raised-result (raise arg)))
            (if (eq? (type-tag raise-result) t)
              raised-result
              (raise-to-helper raised-result t)))
          arg)))

    (map raise-to-helper args))

  (let ((new-args (raise-to args (find-highest-type args)))
        (type-tags (map type-tag new-args))
        (proc (get op type-tags)))
    (if proc
      (apply proc (map contents new-args))
      (error
        "No method for these types -- APPLY-GENERIC"
        (list op type-tags)))))

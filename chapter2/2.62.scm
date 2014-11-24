(define (union-set s1 s2)
  (define (recur a b)
    (cond ((null? a) b)
          ((null? b) a)
          (else (let ((x1 (car a)) (x2 (car b)))
                  (cond ((= x1 x2) (append (list x1) (recur (cdr a) (cdr b))))
                        ((< x1 x2) (append (list x1) (recur (cdr a) b)))
                        (else (append (list x2) (recur a (cdr b)))))))))

  (recur s1 s2))

; ------------------------------------------------------------------------------

(union-set (list 1 3 5 7 9) (list 1 3 5 7))

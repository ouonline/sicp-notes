(define (gcd-list l)
  (define (iter result l)
    (if (null? l)
      result
      (iter (gcd result (car l)) (cdr l))))

  (if (null? l)
    #f
    (iter (car l) (cdr l))))

(define (gcd-terms-modified a b)
  (if (empty-termlist? b)
    (if (empty-termlist? a)
      a
      (let ((gcd-value (gcd-list (map cadr a))))
        (map (lambda (x)
               (list (car x) (/ (cadr x) gcd-value)))
             a)))
    (gcd-terms-modified b (pseudoremainder-terms a b))))

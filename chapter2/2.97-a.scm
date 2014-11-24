(define (reduce-terms n d)
  (let ((gcd-value (gcd-terms-modified n d)))
    (list (div n gcd-value) (div d gcd-value))))

(define (reduce-poly p1 p2)
  (if (not (eq? (variable p1) (variable p2)))
    #f
    (let ((t1 (term-list p1))
          (t2 (term-list p2))
          (var (variable p1))
          (results (reduce-terms t1 t2)))
      (list (make-poly var (car results))
            (make-poly var (cadr results))))))

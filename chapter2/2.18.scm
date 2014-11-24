(define (my-reverse l)
  (define (recur l)
    (if (null? l)
      (list)
      (append (recur (cdr l)) (list (car l)))))
  
  (recur l))

; ----------------------------------------

(my-reverse (list 1 4 9 16 25))

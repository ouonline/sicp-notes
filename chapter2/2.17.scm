(define (last-pair l)
  (define (iter l)
    (if (null? (cdr l))
      (car l)
      (iter (cdr l))))
  
  (iter l))

; ----------------------------------------

(last-pair (list 1 2 3 4))

(define (square-tree t)
  (define (square x) (* x x))

  (cond ((null? t) (list))
        ((pair? (car t))
         (append (list (square-tree (car t)))
                 (square-tree (cdr t))))
        (else
          (append (list (square (car t))) (square-tree (cdr t))))))

; -----------------------------------------------------

(square-tree
  (list 1 (list 2 (list 3 4) 5) (list 6 7)))

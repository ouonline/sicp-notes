(define (tree-map proc t)
  (cond ((null? t) (list))
        ((pair? (car t))
         (append (list (tree-map proc (car t)))
                 (tree-map proc (cdr t))))
        (else
          (append (list (proc (car t))) (tree-map proc (cdr t))))))

; ------------------------------------------------------

(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))

(square-tree
  (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(load "2.3.3-representing-sets.scm")

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list)))))
  (copy-to-list tree '()))

; ------------------------------------------------------------

(define n1 (make-tree 1 '() '()))
(define n3 (make-tree 3 '() '()))
(define n5 (make-tree 5 '() '()))
(define n7 (make-tree 7 '() '()))
(define l (make-tree 2 n1 n3))
(define r (make-tree 6 n5 n7))
(define t (make-tree 4 l r))

(tree->list-1 t)
(tree->list-2 t)

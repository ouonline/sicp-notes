(load "2.62.scm") ; union-set
(load "2.64.scm") ; list->tree

(define (union-set-balanced s1 s2)
  (list->tree (union-set (tree->list-1 s1) (tree->list-2 s2))))

(define (intersection-set-balanced s1 s2)
  (list->tree (intersection-set (tree->list-1 s1) (tree->list-2 s2))))

; ---------------------------------------------------------------------

(load "2.63.scm") ; l and r

(union-set-balanced l r)
(intersection-set-balanced l r)

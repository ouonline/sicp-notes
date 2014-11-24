(load "2.3.3-representing-sets.scm")

(define (key x) (entry x))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= given-key (key set-of-records))
         (key set-of-records))
        ((< given-key (key set-of-records))
         (lookup given-key (left-branch set-of-records)))
        (else (lookup given-key (right-branch set-of-records)))))

; -------------------------------------------------

(define n1 (make-tree 1 '() '()))
(define n3 (make-tree 3 '() '()))
(define n5 (make-tree 5 '() '()))
(define n7 (make-tree 7 '() '()))
(define l (make-tree 2 n1 n3))
(define r (make-tree 6 n5 n7))
(define t (make-tree 4 l r))

(lookup 5 t)

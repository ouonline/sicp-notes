(load "2.3.3-representing-sets.scm")

(define (diff-set s1 s2)
  (define (filter-s s)
    (if (null? s)
      (list)
      (let ((first (car s)) (rest (cdr s)))
        (if (element-of-set? first s2)
          (filter-s rest)
          (append (list first) (filter-s rest))))))

  (if (null? s2)
    s1
    (filter-s s1)))

(define (union-set s1 s2)
  (append (diff-set s1 s2) s2))

; -----------------------------------------------------------

(union-set (list 3 4 5 6 7 8) (list 4 5 3 7))

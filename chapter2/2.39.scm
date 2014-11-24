(load "2.38.scm")

(define (my-reverse sequence)
  (my-fold-right (lambda (x y) (append y (list x))) (list) sequence))

(define (my-reverse-2 sequence)
  (my-fold-left (lambda (x y) (append (list y) x)) (list) sequence))

; -----------------------------------------------------------------

(my-reverse-2 (list 1 2 3 4 5))

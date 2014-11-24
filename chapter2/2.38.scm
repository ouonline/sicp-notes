(load "2.33.scm")

(define (my-fold-right op initial sequence)
  (accumulate op initial sequence))

(define (my-fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  
  (iter initial sequence))

; ---------------------------------------------

(my-fold-right / 1 (list 1 2 3))
(my-fold-left / 1 (list 1 2 3))
(my-fold-right list (list) (list 1 2 3))
(my-fold-left list (list) (list 1 2 3))

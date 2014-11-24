(define (contains-cycle? l)

  (define (forward-1 ll)
    (if (null? ll)
      ll
      (cdr ll)))

  (define (forward-2 ll)
    (if (null? ll)
      ll
      (let ((next (cdr ll)))
        (if (null? next)
          next
          (cdr next)))))
  
  (define (helper l1 l2)
    (let ((e1 (forward-1 l1))
          (e2 (forward-2 l2)))
      (if (null? e2)
        #f
        (if (eq? e1 e2)
          #t
          (helper e1 e2)))))
  
  (helper l l))

; --------------------------------------------

(load "3.12.scm") ; (last-pair)

(define x '(a b c d e f g))
(set-cdr! (last-pair x) x)
(contains-cycle? x)

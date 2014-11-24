(define (make-segment a b)
  (list a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cadr s))

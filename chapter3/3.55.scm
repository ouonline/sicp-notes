(load "3.5.2-infinite-streams.scm")

(define (partial-sums s)
  (cons-stream (stream-car s) (add-streams (partial-sums s) (stream-cdr s))))

; ---------------------------------------------------------------

(define x (partial-sums integers))

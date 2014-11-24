(load "3.50.scm")
(load "3.5.2-infinite-streams.scm")

(define (mul-streams s1 s2)
  (my-stream-map * s1 s2))

(define factorials (cons-stream 1 (mul-streams (stream-cdr integers) factorials)))

; ---------------------------------------------------------------

(stream-list factorials 7)

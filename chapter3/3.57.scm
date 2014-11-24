(load "3.5.2-infinite-streams.scm")

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs) fibs))))

(define f1 (stream-cdr fibs))
(define f2 (stream-cdr f1))
(define f3 (stream-cdr f2))
(stream-car f3)

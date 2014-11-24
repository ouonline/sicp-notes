(load "3.5.2-infinite-streams.scm")

(define s (cons-stream 1 (add-streams s s)))

(stream-ref s 4)

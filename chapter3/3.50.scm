(load "3.5.1-streams-are-delayed-lists.scm")

(define (my-stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply my-stream-map
             (cons proc (map stream-cdr argstreams))))))

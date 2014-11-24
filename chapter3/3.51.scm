(load "3.5.1-streams-are-delayed-lists.scm")

(define (show x)
  (display "internal show -> ")
  (display x)
  (display "\n")
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

(display "---------------------------------------------\n")
(stream-ref x 5)
(display "---------------------------------------------\n")
(stream-ref x 7)

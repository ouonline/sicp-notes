(load "3.5.1-streams-are-delayed-lists.scm")

(define sum 0)

(define (accum x) (set! sum (+ x sum)) sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(map display (list "sum = " sum "\n"))

(define y (stream-filter even? seq))
(map display (list "sum = " sum "\n"))

(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                 seq))
(map display (list "sum = " sum "\n"))

(stream-ref y 7)
(map display (list "sum = " sum "\n"))

(display-stream z)
(map display (list "sum = " sum "\n"))

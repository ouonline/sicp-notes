(load "3.5.3-exploiting-the-stream-paradigm.scm")

(define (ln2-summands n)
  (cons-stream (/ 1.0 n)
               (stream-map - (ln2-summands (+ n 1)))))

(define ln2-stream
  (partial-sums (ln2-summands 1)))

; -------------------------------------------------------

;(display-stream-n ln2-stream 10)
;(display-stream-n (euler-transform ln2-stream) 10)
(display-stream-n (accelerated-sequence euler-transform ln2-stream) 10)

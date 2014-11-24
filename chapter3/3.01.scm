(define (make-accumulator value)
  (define sum value)

  (lambda (x)
    (set! sum (+ sum x))
    sum))

; ---------------------------------------------

(define A (make-accumulator 5))

(A 10)

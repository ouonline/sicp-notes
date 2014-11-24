(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (report x)
    (display "result: ")
    (display x)
    (newline))

  (define (try guess)
    (display "try -> ")
    (display guess)
    (newline)

    (let ((next (f guess)))
      (if (close-enough? guess next)
        (report next)
        (try next))))

  (try first-guess))

; -----------------------------------------------------------

(define (average a b) (/ (+ a b) 2))
(define (func x) (/ (log 1000) (log x)))

(fixed-point (lambda (x) (average x (func x))) 2.0)

(load "1.43.scm")

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))

(define (n-fold-smoothed f n)
  (repeated (smooth f) n))

; --------------------------------------------

(define (identity x) x)

((n-fold-smoothed identity 100) 1)

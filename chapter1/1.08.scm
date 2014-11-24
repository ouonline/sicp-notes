(define (square x) (* x x))
(define (cube x) (* (square x) x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
     0.001))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* guess 2))
     3))

(define (cube-r-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-r-iter (improve guess x) x)))

(define (cube-r x)
  (cube-r-iter 1.0 x))

; ---------------------------------------------------

(cube-r 9)

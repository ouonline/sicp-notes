(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
      guess
      (iter (improve guess))))

  (lambda (guess)
    (iter guess)))

; ---------------------------------------------------

(define (my-sqrt x)
  (define (square y) (* y y))

  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       0.001))

  (define (average a b)
    (/ (+ a b) 2))

  (define (improve guess)
    (average guess (/ x guess)))

  ((iterative-improve good-enough? improve) 1.0))

; ---------------------------------------------------

(define (fixed-point f guess)
  (define tolerance 0.00001)

  (define (good-enough? guess)
    (< (abs (- (f guess) guess))
       tolerance))
  
  (define (improve guess)
    (f guess))

  ((iterative-improve good-enough? improve) 1.0))

; ---------------------------------------------------

(my-sqrt 9)

(fixed-point cos 1.0)

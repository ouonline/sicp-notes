(define (square x) (* x x))

(define (func x y z)
  (- (+ (square x) (square y) (square z))
     (square (min x y z))))

; ---------------------------------------------

(func 5 10 3)

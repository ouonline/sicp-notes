(define (pascal-triangle x y)
  (cond ((or (> x y) (< x 1) (< y 1)) 0)
        ((or (= x 1) (= x y)) 1)
        (else (+ (pascal-triangle (- x 1) (- y 1))
                 (pascal-triangle x (- y 1))))))

; ---------------------------------------------------------

(pascal-triangle 4 5)

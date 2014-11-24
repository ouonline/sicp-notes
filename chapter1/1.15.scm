(define (cube x) (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine ang)
  (if (<= (abs ang) 0.1)
    ang
    (p (sine (/ ang 3.0)))))

; ------------------------------------------------------

(sine 12.15)

(load "1.37.scm")

(define (tan-cf x k)

  (define (n i)
    (if (= i 1)
      x
      (- (* x x))))

  (define (d i)
    (- (* 2 i) 1))

  (cont-frac-recur n d k))

; ---------------------------------------------------

(tan-cf 1.0 40)

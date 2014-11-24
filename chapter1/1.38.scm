(load "1.37.scm")

(define (n i) 1.0)

(define (d i)
  (cond ((= (remainder i 3) 0) 1.0)
        ((= (remainder i 3) 1) 1.0)
        (else (* 2 (/ (+ i 1) 3)))))

(+ 2 (cont-frac-iter n d 20))

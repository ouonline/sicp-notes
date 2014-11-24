(load "1.42.scm")

(define (repeated f n)
  (define (recur i)
    (if (= i 1)
      f
      (compose f (recur (- i 1)))))

  (lambda (x)
    ((recur n) x)))

; --------------------------------------------

(define (square x) (* x x))

((repeated square 2) 5)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))

  (iter k 0))

(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i) (recur (+ i 1))))))

  (recur 1))

; ---------------------------------------------------

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                2)

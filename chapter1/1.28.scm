(define (square x) (* x x))

(define (expmod base e n)
  (define (check x)
    (if (and (not (or (= x 1) (= x (- n 1))))
             (= (remainder (square x) n) 1))
      0
      (remainder (square x) n)))

  (cond ((= e 0) 1)
        ((even? e)
         (check (expmod base (/ e 2) n)))
        (else
          (remainder (* base (expmod base (- e 1) n)) n))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))

  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))

; ----------------------------------------------------------------

(fast-prime? 6601 1)

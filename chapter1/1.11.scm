(define (f-recur n)
  (if (< n 3)
    n
    (+ (f-recur (- n 1))
       (* 2 (f-recur (- n 2)))
       (* 3 (f-recur (- n 3))))))

; --------------------------------------------------------

(define (f-iter-internal n-3 n-2 n-1 count)
  (cond ((< count 3) n-1)
        (else (f-iter-internal n-2 n-1 (+ (* 3 n-3) (* 2 n-2) n-1)
                               (- count 1)))))

(define (f-iter n)
  (f-iter-internal 0 1 2 n))

; --------------------------------------------------------

;(f-recur 7)
(f-iter 7)

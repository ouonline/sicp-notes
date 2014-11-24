(define (integrate-series stream)
  (let ((counter 0))
    (define (recur s)
      (set! counter (+ counter 1))
      (cons-stream (* (/ 1 counter)
                      (stream-car s))
                   (recur (stream-cdr s))))
    
    (recur stream)))

; ---------------------------------------------------

(load "3.54.scm") ; mul-streams
(load "3.5.2-infinite-streams.scm") ; ones integers

(define (div-streams s1 s2)
  (stream-map / s1 s2))

(define (integrate-series a)
  (mul-streams a                                  ; a0, a1, a2, ...
               (div-streams ones integers)))      ; 1/1, 1/2, 1/3, ...

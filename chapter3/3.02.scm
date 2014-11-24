(define (make-momitored f)
  (define sum 0)

  (lambda (x)
    (cond ((eq? x 'how-many-calls?) sum)
          ((eq? x 'reset-count) (set! sum 0))
          (else
            (set! sum (+ sum 1))
            (f x)))))

; ---------------------------------------------

(define s (make-momitored sqrt))

(s 10)
(s 'how-many-calls?)

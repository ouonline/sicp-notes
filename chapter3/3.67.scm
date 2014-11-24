(load "3.5.3-exploiting-the-stream-paradigm.scm")

(define (full-pairs s t)
  (cons-stream (list (stream-car s) (stream-car t))
               (interleave
                 (interleave
                   (stream-map (lambda (x)
                                 (list x (stream-car t)))
                               (stream-cdr s))
                   (stream-map (lambda (x)
                                 (list (stream-car s) x))
                               (stream-cdr t)))
                 (pairs (stream-cdr s) (stream-cdr t)))))

; -----------------------------------------------------------------

(display-stream-n (full-pairs integers integers) 20)

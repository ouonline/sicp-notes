(load "3.5.3-exploiting-the-stream-paradigm.scm")

(define (triples s t u)
  (stream-map (lambda (x)
                (append (car x) (cdr x)))
              (pairs (pairs s t) u)))

; ------------------------------------------------------------

(display-stream-n (triples integers integers integers) 100)

(define (square x) (* x x))

(stream-filter (lambda (x)
                 (= (+ (square (car x))
                       (square (cadr x)))
                    (square (caddr x))))
               (triples integers integers integers))

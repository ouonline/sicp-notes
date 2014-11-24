(load "3.5.3-exploiting-the-stream-paradigm.scm")

(define (sqrt-stream x)
  (cons-stream 1.0
               (stream-map (lambda (guess)
                             (map display (list "computing guess " guess "...\n"))
                             (sqrt-improve guess x))
                           (sqrt-stream x))))

(define (sqrt-stream-new x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (map display (list "computing guess " guess "...\n"))
                               (sqrt-improve guess x))
                             guesses)))

  guesses)

(display-stream-n (sqrt-stream 2) 10)
(display-stream-n (sqrt-stream-new 2) 10)

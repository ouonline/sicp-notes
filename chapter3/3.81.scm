(load "3.50.scm")

(define random-init 5)
(define (rand-update num) (+ num 5))

(define (rand-generator cmd-stream)
  (define result-stream
    (cons-stream random-init
                 (my-stream-map (lambda (cmd num)
                                  (cond ((eq? cmd 'generate)
                                         (rand-update num))
                                        ((eq? cmd 'reset)
                                         random-init)
                                        (else
                                          (display "error command"...))))
                                cmd-stream
                                result-stream)))

  result-stream)

; --------------------------------------------------------------------------------

(define cmd-stream
  (cons-stream 'generate cmd-stream))

(stream-list (rand-generator cmd-stream) 10)

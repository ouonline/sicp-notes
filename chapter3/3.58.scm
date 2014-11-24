(load "3.5.1-streams-are-delayed-lists.scm")

(define (expand num den radix)
  (cons-stream (quotient (* num radix) den)
               (expand (remainder (* num radix) den) den radix)))

; ---------------------------------------------------------------

(stream-list (expand 1 7 10) 10)

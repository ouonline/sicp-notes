(define (my-for-each proc items)
  (map proc items))

; ----------------------------------------------------

(my-for-each (lambda (x) (display x) (newline))
             (list 57 321 88))

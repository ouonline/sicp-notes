(define (count-leaves t)
  (display "t -> ")
  (display t)
  (newline)

  (cond ((null? t) 0)
        ((not (pair? t)) 1)
        (else (+ (count-leaves (car t))
                 (count-leaves (cdr t))))))

; -----------------------------------------------

(count-leaves (list (list 1 2) 3 4))

(define (deep-reverse l)
  (cond ((null? l) (list))
        ((pair? (car l))
         (append (deep-reverse (cdr l))
                 (list (deep-reverse (car l)))))
        (else
          (append (deep-reverse (cdr l))
                  (list (car l))))))

; ------------------------------------------------------

(define x (list 7 8 9 (list 1 2) (list 3 4 (list 5 6))))

(display x)
(newline)
(deep-reverse x)

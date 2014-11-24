(define (square-list items)
  (define (square x) (* x x))
  (if (null? items)
    (list)
    (cons (square (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))

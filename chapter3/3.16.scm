(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

; 3
(define x (cons 'a 'a))
(define z (cons x x))
(count-pairs z)

; 4
(define x (cons 'a 'a))
(define y (cons 'a x))
(define z (cons x y))
(count-pairs z)

; 7
(define x (cons 'a 'b))
(define y (cons x x))
(define z (cons y y))
(count-pairs z)

; never returns
(define x (cons 'a 'a))
(define y (cons 'a 'a))
(define z (cons 'a 'a))
(set-cdr! x y)
(set-cdr! y z)
(set-cdr! z x)
(count-pairs z)
